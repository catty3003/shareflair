require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get all_user" do
    get :all_user
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end
