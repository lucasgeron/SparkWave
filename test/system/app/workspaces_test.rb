require "application_system_test_case"

class App::WorkspacesTest < ApplicationSystemTestCase
  setup do
    @app_workspace = app_workspaces(:one)
  end

  test "visiting the index" do
    visit app_workspaces_url
    assert_selector "h1", text: "Workspaces"
  end

  test "should create workspace" do
    visit app_workspaces_url
    click_on "New workspace"

    fill_in "Health unit", with: @app_workspace.health_unit_id
    click_on "Create Workspace"

    assert_text "Workspace was successfully created"
    click_on "Back"
  end

  test "should update Workspace" do
    visit app_workspace_url(@app_workspace)
    click_on "Edit this workspace", match: :first

    fill_in "Health unit", with: @app_workspace.health_unit_id
    click_on "Update Workspace"

    assert_text "Workspace was successfully updated"
    click_on "Back"
  end

  test "should destroy Workspace" do
    visit app_workspace_url(@app_workspace)
    click_on "Destroy this workspace", match: :first

    assert_text "Workspace was successfully destroyed"
  end
end
