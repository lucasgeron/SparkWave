require "test_helper"

class App::SpecializationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_specialization = app_specializations(:one)
  end

  test "should get index" do
    get app_specializations_url
    assert_response :success
  end

  test "should get new" do
    get new_app_specialization_url
    assert_response :success
  end

  test "should create app_specialization" do
    assert_difference("App::Specialization.count") do
      post app_specializations_url, params: { app_specialization: { area_id: @app_specialization.area_id, name: @app_specialization.name } }
    end

    assert_redirected_to app_specialization_url(App::Specialization.last)
  end

  test "should show app_specialization" do
    get app_specialization_url(@app_specialization)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_specialization_url(@app_specialization)
    assert_response :success
  end

  test "should update app_specialization" do
    patch app_specialization_url(@app_specialization), params: { app_specialization: { area_id: @app_specialization.area_id, name: @app_specialization.name } }
    assert_redirected_to app_specialization_url(@app_specialization)
  end

  test "should destroy app_specialization" do
    assert_difference("App::Specialization.count", -1) do
      delete app_specialization_url(@app_specialization)
    end

    assert_redirected_to app_specializations_url
  end
end
