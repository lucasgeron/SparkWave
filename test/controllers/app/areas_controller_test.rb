require "test_helper"

class App::AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_area = app_areas(:one)
  end

  test "should get index" do
    get app_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_app_area_url
    assert_response :success
  end

  test "should create app_area" do
    assert_difference("App::Area.count") do
      post app_areas_url, params: { app_area: { name: @app_area.name } }
    end

    assert_redirected_to app_area_url(App::Area.last)
  end

  test "should show app_area" do
    get app_area_url(@app_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_area_url(@app_area)
    assert_response :success
  end

  test "should update app_area" do
    patch app_area_url(@app_area), params: { app_area: { name: @app_area.name } }
    assert_redirected_to app_area_url(@app_area)
  end

  test "should destroy app_area" do
    assert_difference("App::Area.count", -1) do
      delete app_area_url(@app_area)
    end

    assert_redirected_to app_areas_url
  end
end
