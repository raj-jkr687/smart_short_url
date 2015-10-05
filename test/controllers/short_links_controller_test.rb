require 'test_helper'

class ShortLinksControllerTest < ActionController::TestCase
  setup do
    @short_link = short_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:short_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short_link" do
    assert_difference('ShortLink.count') do
      post :create, short_link: { base_url: @short_link.base_url, no_of_clicks: @short_link.no_of_clicks, short_url: @short_link.short_url }
    end

    assert_redirected_to short_link_path(assigns(:short_link))
  end

  test "should show short_link" do
    get :show, id: @short_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short_link
    assert_response :success
  end

  test "should update short_link" do
    patch :update, id: @short_link, short_link: { base_url: @short_link.base_url, no_of_clicks: @short_link.no_of_clicks, short_url: @short_link.short_url }
    assert_redirected_to short_link_path(assigns(:short_link))
  end

  test "should destroy short_link" do
    assert_difference('ShortLink.count', -1) do
      delete :destroy, id: @short_link
    end

    assert_redirected_to short_links_path
  end
end
