require "test_helper"

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get meetings_create_url
    assert_response :success
  end
end
