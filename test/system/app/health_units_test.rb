require "application_system_test_case"

class App::HealthUnitsTest < ApplicationSystemTestCase
  setup do
    @app_health_unit = app_health_units(:one)
  end

  test "visiting the index" do
    visit app_health_units_url
    assert_selector "h1", text: "Health units"
  end

  test "should create health unit" do
    visit app_health_units_url
    click_on "New health unit"

    fill_in "Address", with: @app_health_unit.address
    fill_in "City", with: @app_health_unit.city
    fill_in "Name", with: @app_health_unit.name
    fill_in "Phone", with: @app_health_unit.phone
    fill_in "Token", with: @app_health_unit.token
    fill_in "Type", with: @app_health_unit.type
    click_on "Create Health unit"

    assert_text "Health unit was successfully created"
    click_on "Back"
  end

  test "should update Health unit" do
    visit app_health_unit_url(@app_health_unit)
    click_on "Edit this health unit", match: :first

    fill_in "Address", with: @app_health_unit.address
    fill_in "City", with: @app_health_unit.city
    fill_in "Name", with: @app_health_unit.name
    fill_in "Phone", with: @app_health_unit.phone
    fill_in "Token", with: @app_health_unit.token
    fill_in "Type", with: @app_health_unit.type
    click_on "Update Health unit"

    assert_text "Health unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Health unit" do
    visit app_health_unit_url(@app_health_unit)
    click_on "Destroy this health unit", match: :first

    assert_text "Health unit was successfully destroyed"
  end
end
