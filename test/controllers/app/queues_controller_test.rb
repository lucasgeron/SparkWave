require "test_helper"

class App::QueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_queue = app_queues(:one)
  end

  test "should get index" do
    get app_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_app_queue_url
    assert_response :success
  end

  test "should create app_queue" do
    assert_difference("App::Queue.count") do
      post app_queues_url, params: { app_queue: { category: @app_queue.category, workspace_id: @app_queue.workspace_id } }
    end

    assert_redirected_to app_queue_url(App::Queue.last)
  end

  test "should show app_queue" do
    get app_queue_url(@app_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_queue_url(@app_queue)
    assert_response :success
  end

  test "should update app_queue" do
    patch app_queue_url(@app_queue), params: { app_queue: { category: @app_queue.category, workspace_id: @app_queue.workspace_id } }
    assert_redirected_to app_queue_url(@app_queue)
  end

  test "should destroy app_queue" do
    assert_difference("App::Queue.count", -1) do
      delete app_queue_url(@app_queue)
    end

    assert_redirected_to app_queues_url
  end
end
