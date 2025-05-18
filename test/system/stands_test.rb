require "application_system_test_case"

class StandsTest < ApplicationSystemTestCase
  setup do
    @stand = stands(:one)
  end

  test "visiting the index" do
    visit stands_url
    assert_selector "h1", text: "Stands"
  end

  test "should create stand" do
    visit stands_url
    click_on "New stand"

    fill_in "Cooler", with: @stand.cooler
    fill_in "Depth", with: @stand.depth
    fill_in "Description", with: @stand.description
    fill_in "Diameter", with: @stand.diameter
    fill_in "Height", with: @stand.height
    fill_in "Misc", with: @stand.misc
    check "Power" if @stand.power
    check "Selfdriver" if @stand.selfdriver
    fill_in "Specials", with: @stand.specials
    fill_in "Table", with: @stand.table
    check "Trailer" if @stand.trailer
    fill_in "Vendor", with: @stand.vendor_id
    fill_in "Width", with: @stand.width
    click_on "Create Stand"

    assert_text "Stand was successfully created"
    click_on "Back"
  end

  test "should update Stand" do
    visit stand_url(@stand)
    click_on "Edit this stand", match: :first

    fill_in "Cooler", with: @stand.cooler
    fill_in "Depth", with: @stand.depth
    fill_in "Description", with: @stand.description
    fill_in "Diameter", with: @stand.diameter
    fill_in "Height", with: @stand.height
    fill_in "Misc", with: @stand.misc
    check "Power" if @stand.power
    check "Selfdriver" if @stand.selfdriver
    fill_in "Specials", with: @stand.specials
    fill_in "Table", with: @stand.table
    check "Trailer" if @stand.trailer
    fill_in "Vendor", with: @stand.vendor_id
    fill_in "Width", with: @stand.width
    click_on "Update Stand"

    assert_text "Stand was successfully updated"
    click_on "Back"
  end

  test "should destroy Stand" do
    visit stand_url(@stand)
    click_on "Destroy this stand", match: :first

    assert_text "Stand was successfully destroyed"
  end
end
