class ShortLink < ActiveRecord::Base
  after_create :shorten_url
  
  validates :base_url, presence: true, uniqueness: true,format: { with: URI.regexp, message: "Invalid URL format" }
  has_many :short_address, dependent: :destroy
  
  def shorten_url
    self.short_url = ("%d%d" % [rand(100), Time.now.to_i]).to_i.to_s(36)
    self.save
  end
end
