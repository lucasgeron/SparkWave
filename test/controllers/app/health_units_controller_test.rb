require "test_helper"

class App::HealthUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_health_unit = app_health_units(:one)
  end

  test "should get index" do
    get app_health_units_url
    assert_response :success
  end

  test "should get new" do
    get new_app_health_unit_url
    assert_response :success
  end

  test "should create app_health_unit" do
    assert_difference("App::HealthUnit.count") do
      post app_health_units_url, params: { app_health_unit: { address: @app_health_unit.address, city: @app_health_unit.city, name: @app_health_unit.name, phone: @app_health_unit.phone, token: @app_health_unit.token, type: @app_health_unit.type } }
    end

    assert_redirected_to app_health_unit_url(App::HealthUnit.last)
  end

  test "should show app_health_unit" do
    get app_health_unit_url(@app_health_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_health_unit_url(@app_health_unit)
    assert_response :success
  end

  test "should update app_health_unit" do
    patch app_health_unit_url(@app_health_unit), params: { app_health_unit: { address: @app_health_unit.address, city: @app_health_unit.city, name: @app_health_unit.name, phone: @app_health_unit.phone, token: @app_health_unit.token, type: @app_health_unit.type } }
    assert_redirected_to app_health_unit_url(@app_health_unit)
  end

  test "should destroy app_health_unit" do
    assert_difference("App::HealthUnit.count", -1) do
      delete app_health_unit_url(@app_health_unit)
    end

    assert_redirected_to app_health_units_url
  end
end
