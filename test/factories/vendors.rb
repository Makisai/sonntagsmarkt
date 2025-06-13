FactoryBot.define do
  factory :vendor do
    name { "MyString" }
    legalform { "MyString" }
    contact { "MyString" }
    address { "MyString" }
    phone { 12345678910 }
    email { "MyString@example.com" }
    taxnumber { "MyString" }
    taxoffice { "MyString" }
    last_visit { 2025-05-11 }
    visit_day { "Samstag" }
  end
end
