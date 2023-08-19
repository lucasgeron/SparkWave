require "application_system_test_case"

class App::QueuesTest < ApplicationSystemTestCase
  setup do
    @app_queue = app_queues(:one)
  end

  test "visiting the index" do
    visit app_queues_url
    assert_selector "h1", text: "Queues"
  end

  test "should create queue" do
    visit app_queues_url
    click_on "New queue"

    fill_in "Category", with: @app_queue.category
    fill_in "Workspace", with: @app_queue.workspace_id
    click_on "Create Queue"

    assert_text "Queue was successfully created"
    click_on "Back"
  end

  test "should update Queue" do
    visit app_queue_url(@app_queue)
    click_on "Edit this queue", match: :first

    fill_in "Category", with: @app_queue.category
    fill_in "Workspace", with: @app_queue.workspace_id
    click_on "Update Queue"

    assert_text "Queue was successfully updated"
    click_on "Back"
  end

  test "should destroy Queue" do
    visit app_queue_url(@app_queue)
    click_on "Destroy this queue", match: :first

    assert_text "Queue was successfully destroyed"
  end
end
