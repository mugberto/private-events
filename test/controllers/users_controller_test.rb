require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get users_new,_url
    assert_response :success
  end

  test "should get create," do
    get users_create,_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
