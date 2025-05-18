require "application_system_test_case"

class VendorsTest < ApplicationSystemTestCase
  setup do
    @vendor = vendors(:one)
  end

  test "visiting the index" do
    visit vendors_url
    assert_selector "h1", text: "Vendors"
  end

  test "should create vendor" do
    visit vendors_url
    click_on "New vendor"

    fill_in "Address", with: @vendor.address
    fill_in "Contact", with: @vendor.contact
    fill_in "Email", with: @vendor.email
    fill_in "Last visit", with: @vendor.last_visit
    fill_in "Legalform", with: @vendor.legalform
    fill_in "Name", with: @vendor.name
    fill_in "Phone", with: @vendor.phone
    fill_in "Taxnumber", with: @vendor.taxnumber
    fill_in "Taxoffice", with: @vendor.taxoffice
    fill_in "Visit day", with: @vendor.visit_day
    click_on "Create Vendor"

    assert_text "Vendor was successfully created"
    click_on "Back"
  end

  test "should update Vendor" do
    visit vendor_url(@vendor)
    click_on "Edit this vendor", match: :first

    fill_in "Address", with: @vendor.address
    fill_in "Contact", with: @vendor.contact
    fill_in "Email", with: @vendor.email
    fill_in "Last visit", with: @vendor.last_visit
    fill_in "Legalform", with: @vendor.legalform
    fill_in "Name", with: @vendor.name
    fill_in "Phone", with: @vendor.phone
    fill_in "Taxnumber", with: @vendor.taxnumber
    fill_in "Taxoffice", with: @vendor.taxoffice
    fill_in "Visit day", with: @vendor.visit_day
    click_on "Update Vendor"

    assert_text "Vendor was successfully updated"
    click_on "Back"
  end

  test "should destroy Vendor" do
    visit vendor_url(@vendor)
    click_on "Destroy this vendor", match: :first

    assert_text "Vendor was successfully destroyed"
  end
end
