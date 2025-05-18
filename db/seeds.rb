# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

5.times do
    vendor = Vendor.create(
        name: Faker::Company.name, 
        legalform: Faker::Company.suffix,
        contact: Faker::Name.name,
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        taxnumber: Faker::Company.ein,
        taxoffice: Faker::Address.city,
        last_visit: Faker::Date.between(from: 1.year.ago, to: Date.today),
        visit_day: "Sonntag",
    )

    vendor.stand = Stand.create(
        width: Faker::Number.between(from: 1, to: 10), 
        height: Faker::Number.between(from: 1, to: 10), 
        depth: Faker::Number.between(from: 1, to: 10),
        diameter: Faker::Number.between(from: 1, to: 10),
        description: Faker::Lorem.sentence(word_count: 10),
        cooler: Faker::Number.between(from: 1, to: 3),
        table: Faker::Number.between(from: 1, to: 5),
        selfdriver: Faker::Boolean.boolean,
        trailer: Faker::Boolean.boolean,
        power: Faker::Boolean.boolean,
        specials: Faker::Lorem.sentence(word_count: 10),
        misc: Faker::Lorem.sentence(word_count: 10),
    )
    vendor.save!
end