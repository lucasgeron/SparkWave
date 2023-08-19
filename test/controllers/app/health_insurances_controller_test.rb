require "test_helper"

class App::HealthInsurancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_health_insurance = app_health_insurances(:one)
  end

  test "should get index" do
    get app_health_insurances_url
    assert_response :success
  end

  test "should get new" do
    get new_app_health_insurance_url
    assert_response :success
  end

  test "should create app_health_insurance" do
    assert_difference("App::HealthInsurance.count") do
      post app_health_insurances_url, params: { app_health_insurance: { name: @app_health_insurance.name } }
    end

    assert_redirected_to app_health_insurance_url(App::HealthInsurance.last)
  end

  test "should show app_health_insurance" do
    get app_health_insurance_url(@app_health_insurance)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_health_insurance_url(@app_health_insurance)
    assert_response :success
  end

  test "should update app_health_insurance" do
    patch app_health_insurance_url(@app_health_insurance), params: { app_health_insurance: { name: @app_health_insurance.name } }
    assert_redirected_to app_health_insurance_url(@app_health_insurance)
  end

  test "should destroy app_health_insurance" do
    assert_difference("App::HealthInsurance.count", -1) do
      delete app_health_insurance_url(@app_health_insurance)
    end

    assert_redirected_to app_health_insurances_url
  end
end
