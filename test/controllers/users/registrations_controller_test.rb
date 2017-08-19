require 'test_helper'

class Users::RegistrationsController < ActionDispatch::IntegrationTest
	test "should create user" do
    post :create, user: { email: "temp12345@email.com", first_name: @user.first_name}
    assert_redirected_to user_path(assigns(:user))
end
end
