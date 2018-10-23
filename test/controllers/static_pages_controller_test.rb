require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get lobby" do
    get lobby_path
    assert_response :success
  end

  test "should get chatroom" do
    get chatroom_path
    assert_response :success
  end

end
