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

  test "#last_changes_from should return email of user with latest change to vendor or stand" do
    user1 = FactoryBot.create(:user, email_address: "user1@example.com")
    user2 = FactoryBot.create(:user, email_address: "user2@example.com")
    
    PaperTrail.request.whodunnit = user1.id.to_s
    vendor = FactoryBot.create(:vendor)
    stand = FactoryBot.create(:stand, vendor: vendor)
    PaperTrail.request.whodunnit = user2.id.to_s
    stand.update(description: "Updated description")

    assert_equal "user1@example.com", vendor.last_changes_from
    assert_equal "user2@example.com", stand.vendor.last_changes_from

  end
end
