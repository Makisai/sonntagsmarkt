class Vendor < ApplicationRecord
    has_one :stand, dependent: :destroy

    validates :name, presence: true
    validates :contact, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: I18n.t("validator.phone") }
    validates :address, presence: true
end
