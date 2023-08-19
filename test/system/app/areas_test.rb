require "application_system_test_case"

class App::AreasTest < ApplicationSystemTestCase
  setup do
    @app_area = app_areas(:one)
  end

  test "visiting the index" do
    visit app_areas_url
    assert_selector "h1", text: "Areas"
  end

  test "should create area" do
    visit app_areas_url
    click_on "New area"

    fill_in "Name", with: @app_area.name
    click_on "Create Area"

    assert_text "Area was successfully created"
    click_on "Back"
  end

  test "should update Area" do
    visit app_area_url(@app_area)
    click_on "Edit this area", match: :first

    fill_in "Name", with: @app_area.name
    click_on "Update Area"

    assert_text "Area was successfully updated"
    click_on "Back"
  end

  test "should destroy Area" do
    visit app_area_url(@app_area)
    click_on "Destroy this area", match: :first

    assert_text "Area was successfully destroyed"
  end
end
