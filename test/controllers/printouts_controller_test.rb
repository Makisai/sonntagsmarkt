require "test_helper"

class PrintoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get printouts_show_url
    assert_response :success
  end

  test "should get browser_ws_endpoint" do
    get printouts_browser_ws_endpoint_url
    assert_response :success
  end
end
