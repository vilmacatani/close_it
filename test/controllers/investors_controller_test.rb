require "test_helper"

class InvestorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get investors_new_url
    assert_response :success
  end

  test "should get update" do
    get investors_update_url
    assert_response :success
  end

  test "should get index" do
    get investors_index_url
    assert_response :success
  end

  test "should get show" do
    get investors_show_url
    assert_response :success
  end
end
