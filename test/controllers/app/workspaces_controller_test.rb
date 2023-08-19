require "test_helper"

class App::WorkspacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_workspace = app_workspaces(:one)
  end

  test "should get index" do
    get app_workspaces_url
    assert_response :success
  end

  test "should get new" do
    get new_app_workspace_url
    assert_response :success
  end

  test "should create app_workspace" do
    assert_difference("App::Workspace.count") do
      post app_workspaces_url, params: { app_workspace: { health_unit_id: @app_workspace.health_unit_id } }
    end

    assert_redirected_to app_workspace_url(App::Workspace.last)
  end

  test "should show app_workspace" do
    get app_workspace_url(@app_workspace)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_workspace_url(@app_workspace)
    assert_response :success
  end

  test "should update app_workspace" do
    patch app_workspace_url(@app_workspace), params: { app_workspace: { health_unit_id: @app_workspace.health_unit_id } }
    assert_redirected_to app_workspace_url(@app_workspace)
  end

  test "should destroy app_workspace" do
    assert_difference("App::Workspace.count", -1) do
      delete app_workspace_url(@app_workspace)
    end

    assert_redirected_to app_workspaces_url
  end
end
