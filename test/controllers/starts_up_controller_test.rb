require "test_helper"

class StartsUpControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get starts_up_new_url
    assert_response :success
  end
end
