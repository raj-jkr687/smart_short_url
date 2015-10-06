class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:edit, :update, :destroy,:short_address]

  # GET /short_links
  # GET /short_links.json
  def index
    @short_link = ShortLink.new
    @top_short_links = ShortLink.order(updated_at: :desc)
    @original_url = request.original_url
    
  end

  # GET /short_links/1
  # GET /short_links/1.json
  def show
    if params[:short_url]
      @short_link = ShortLink.find_by(short_url: params[:short_url])
      if redirect_to @short_link.base_url
        @short_link.increment!(:no_of_clicks)
        statistic = @short_link.short_address.find_or_initialize_by(ip_address: request.remote_ip)
        if statistic.new_record?
          statistic.save!
        else
          statistic.increment!(:no_of_clicks)
        end
      end
    else
      @short_link = ShortLink.find(params[:id])
    end
  end

  # GET /short_links/new
  def new
    @short_link = ShortLink.new
  end

  # GET /short_links/1/edit
  def edit
  end

  # POST /short_links
  # POST /short_links.json
  def create
    @short_link = ShortLink.new(short_link_params)

    respond_to do |format|
      if @short_link.save
        format.html { redirect_to '/', notice: 'Short link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /short_links/1
  # PATCH/PUT /short_links/1.json
  def update
    respond_to do |format|
      if @short_link.update(short_link_params)
        format.html { redirect_to @short_link, notice: 'Short link was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_link }
      else
        format.html { render :edit }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def short_address
    @statistics = @short_link.short_address
  end
  
  
  
  # DELETE /short_links/1
  # DELETE /short_links/1.json
  def destroy
    @short_link.destroy
    respond_to do |format|
      format.html { redirect_to short_links_url, notice: 'Short link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_short_link
    @short_link = ShortLink.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def short_link_params
    params.require(:short_link).permit(:base_url, :short_url, :no_of_clicks)
  end
end
