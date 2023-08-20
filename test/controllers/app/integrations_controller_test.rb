require "test_helper"

class App::IntegrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_integrations_index_url
    assert_response :success
  end
end
