class Vendor < ApplicationRecord
    has_one :stand, dependent: :destroy

    validates :name, presence: true
    validates :contact, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: I18n.t("validator.phone") }
    validates :address, presence: true

    has_paper_trail

    def last_changes_from
      User.find(paper_trail.originator).email_address if paper_trail.originator
    end
end
