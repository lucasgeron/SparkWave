require "application_system_test_case"

class App::ProfessionalsTest < ApplicationSystemTestCase
  setup do
    @app_professional = app_professionals(:one)
  end

  test "visiting the index" do
    visit app_professionals_url
    assert_selector "h1", text: "Professionals"
  end

  test "should create professional" do
    visit app_professionals_url
    click_on "New professional"

    fill_in "Crm", with: @app_professional.crm
    fill_in "Name", with: @app_professional.name
    fill_in "Role", with: @app_professional.role
    click_on "Create Professional"

    assert_text "Professional was successfully created"
    click_on "Back"
  end

  test "should update Professional" do
    visit app_professional_url(@app_professional)
    click_on "Edit this professional", match: :first

    fill_in "Crm", with: @app_professional.crm
    fill_in "Name", with: @app_professional.name
    fill_in "Role", with: @app_professional.role
    click_on "Update Professional"

    assert_text "Professional was successfully updated"
    click_on "Back"
  end

  test "should destroy Professional" do
    visit app_professional_url(@app_professional)
    click_on "Destroy this professional", match: :first

    assert_text "Professional was successfully destroyed"
  end
end
