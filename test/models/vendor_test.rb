require "test_helper"

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test "#last_changes_from should return email of user to last edit vendor" do
    user = FactoryBot.create(:user, email_address: "user@example.com")
    PaperTrail.request.whodunnit = user.id.to_s

    vendor = FactoryBot.create(:vendor)

    assert_equal "user@example.com", vendor.last_changes_from
  end

  test "#last_changes_from should return email of user to last edit stand" do
    user = FactoryBot.create(:user, email_address: "user@example.com")
    PaperTrail.request.whodunnit = user.id.to_s

    stand = FactoryBot.create(:stand)

    assert_equal "user@example.com", stand.vendor.last_changes_from
  end
end
