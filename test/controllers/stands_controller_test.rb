require "test_helper"

class StandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stand = stands(:one)
  end

  test "should get index" do
    get stands_url
    assert_response :success
  end

  test "should get new" do
    get new_stand_url
    assert_response :success
  end

  test "should create stand" do
    assert_difference("Stand.count") do
      post stands_url, params: { stand: { cooler: @stand.cooler, depth: @stand.depth, description: @stand.description, diameter: @stand.diameter, height: @stand.height, misc: @stand.misc, power: @stand.power, selfdriver: @stand.selfdriver, specials: @stand.specials, table: @stand.table, trailer: @stand.trailer, vendor_id: @stand.vendor_id, width: @stand.width } }
    end

    assert_redirected_to stand_url(Stand.last)
  end

  test "should show stand" do
    get stand_url(@stand)
    assert_response :success
  end

  test "should get edit" do
    get edit_stand_url(@stand)
    assert_response :success
  end

  test "should update stand" do
    patch stand_url(@stand), params: { stand: { cooler: @stand.cooler, depth: @stand.depth, description: @stand.description, diameter: @stand.diameter, height: @stand.height, misc: @stand.misc, power: @stand.power, selfdriver: @stand.selfdriver, specials: @stand.specials, table: @stand.table, trailer: @stand.trailer, vendor_id: @stand.vendor_id, width: @stand.width } }
    assert_redirected_to stand_url(@stand)
  end

  test "should destroy stand" do
    assert_difference("Stand.count", -1) do
      delete stand_url(@stand)
    end

    assert_redirected_to stands_url
  end
end
