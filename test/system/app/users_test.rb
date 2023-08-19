require "application_system_test_case"

class App::UsersTest < ApplicationSystemTestCase
  setup do
    @app_user = app_users(:one)
  end

  test "visiting the index" do
    visit app_users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit app_users_url
    click_on "New user"

    check "Finished" if @app_user.finished
    fill_in "Queue", with: @app_user.queue_id
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit app_user_url(@app_user)
    click_on "Edit this user", match: :first

    check "Finished" if @app_user.finished
    fill_in "Queue", with: @app_user.queue_id
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit app_user_url(@app_user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
