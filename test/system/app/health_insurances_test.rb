require "application_system_test_case"

class App::HealthInsurancesTest < ApplicationSystemTestCase
  setup do
    @app_health_insurance = app_health_insurances(:one)
  end

  test "visiting the index" do
    visit app_health_insurances_url
    assert_selector "h1", text: "Health insurances"
  end

  test "should create health insurance" do
    visit app_health_insurances_url
    click_on "New health insurance"

    fill_in "Name", with: @app_health_insurance.name
    click_on "Create Health insurance"

    assert_text "Health insurance was successfully created"
    click_on "Back"
  end

  test "should update Health insurance" do
    visit app_health_insurance_url(@app_health_insurance)
    click_on "Edit this health insurance", match: :first

    fill_in "Name", with: @app_health_insurance.name
    click_on "Update Health insurance"

    assert_text "Health insurance was successfully updated"
    click_on "Back"
  end

  test "should destroy Health insurance" do
    visit app_health_insurance_url(@app_health_insurance)
    click_on "Destroy this health insurance", match: :first

    assert_text "Health insurance was successfully destroyed"
  end
end
