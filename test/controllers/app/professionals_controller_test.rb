require "test_helper"

class App::ProfessionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_professional = app_professionals(:one)
  end

  test "should get index" do
    get app_professionals_url
    assert_response :success
  end

  test "should get new" do
    get new_app_professional_url
    assert_response :success
  end

  test "should create app_professional" do
    assert_difference("App::Professional.count") do
      post app_professionals_url, params: { app_professional: { crm: @app_professional.crm, name: @app_professional.name, role: @app_professional.role } }
    end

    assert_redirected_to app_professional_url(App::Professional.last)
  end

  test "should show app_professional" do
    get app_professional_url(@app_professional)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_professional_url(@app_professional)
    assert_response :success
  end

  test "should update app_professional" do
    patch app_professional_url(@app_professional), params: { app_professional: { crm: @app_professional.crm, name: @app_professional.name, role: @app_professional.role } }
    assert_redirected_to app_professional_url(@app_professional)
  end

  test "should destroy app_professional" do
    assert_difference("App::Professional.count", -1) do
      delete app_professional_url(@app_professional)
    end

    assert_redirected_to app_professionals_url
  end
end
