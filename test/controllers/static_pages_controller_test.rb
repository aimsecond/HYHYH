require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get video_room" do
    get static_pages_video_room_url
    assert_response :success
  end

  test "should get create_room" do
    get static_pages_create_room_url
    assert_response :success
  end

end
