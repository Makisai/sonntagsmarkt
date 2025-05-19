require "test_helper"

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get vendors_url
    assert_response :success
  end

  test "should get new" do
    get new_vendor_url
    assert_response :success
  end

  test "should create vendor" do
    assert_difference("Vendor.count") do
      post vendors_url, params: { vendor: { address: @vendor.address, contact: @vendor.contact, email: @vendor.email, last_visit: @vendor.last_visit, legalform: @vendor.legalform, name: @vendor.name, phone: @vendor.phone, taxnumber: @vendor.taxnumber, taxoffice: @vendor.taxoffice, visit_day: @vendor.visit_day } }
    end

    assert_redirected_to new_stand_path(vendor_id: Vendor.last.id)
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end

  test "should get edit" do
    get edit_vendor_url(@vendor)
    assert_response :success
  end

  test "should update vendor" do
    patch vendor_url(@vendor), params: { vendor: { address: @vendor.address, contact: @vendor.contact, email: @vendor.email, last_visit: @vendor.last_visit, legalform: @vendor.legalform, name: @vendor.name, phone: @vendor.phone, taxnumber: @vendor.taxnumber, taxoffice: @vendor.taxoffice, visit_day: @vendor.visit_day } }
    assert_redirected_to vendor_url(@vendor)
  end

  test "should destroy vendor" do
    assert_difference("Vendor.count", -1) do
      delete vendor_url(@vendor)
    end

    assert_redirected_to vendors_url
  end
end
