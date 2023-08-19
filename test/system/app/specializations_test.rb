require "application_system_test_case"

class App::SpecializationsTest < ApplicationSystemTestCase
  setup do
    @app_specialization = app_specializations(:one)
  end

  test "visiting the index" do
    visit app_specializations_url
    assert_selector "h1", text: "Specializations"
  end

  test "should create specialization" do
    visit app_specializations_url
    click_on "New specialization"

    fill_in "Area", with: @app_specialization.area_id
    fill_in "Name", with: @app_specialization.name
    click_on "Create Specialization"

    assert_text "Specialization was successfully created"
    click_on "Back"
  end

  test "should update Specialization" do
    visit app_specialization_url(@app_specialization)
    click_on "Edit this specialization", match: :first

    fill_in "Area", with: @app_specialization.area_id
    fill_in "Name", with: @app_specialization.name
    click_on "Update Specialization"

    assert_text "Specialization was successfully updated"
    click_on "Back"
  end

  test "should destroy Specialization" do
    visit app_specialization_url(@app_specialization)
    click_on "Destroy this specialization", match: :first

    assert_text "Specialization was successfully destroyed"
  end
end
