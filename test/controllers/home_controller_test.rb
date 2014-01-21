require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get insert" do
    get :insert
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
