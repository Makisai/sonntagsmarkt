FactoryBot.define do
  factory :user do
    email_address { "user@example.com" }
    password_digest { BCrypt::Password.create("password") }
  end
end
