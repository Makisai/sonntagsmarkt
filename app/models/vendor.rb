class Vendor < ApplicationRecord
    has_one :stand, dependent: :destroy

    validates :name, presence: true
    validates :contact, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: I18n.t("validator.phone") }
    validates :address, presence: true

    has_paper_trail

    VISIT_DAYS = [ "saturday", "sunday", "both" ]

    def last_changes_from
      last_version = if stand.present?
       last_version_of_vendor_and_stand
      else
        versions.last
      end

      User.find(last_version.whodunnit).email_address if last_version.present? && last_version.whodunnit.present?
    end

    private def last_version_of_vendor_and_stand
      last_stand_version = stand.versions.last
      last_vendor_version = versions.last

      last_stand_version.created_at > last_vendor_version.created_at ? last_stand_version : last_vendor_version
    end

end
