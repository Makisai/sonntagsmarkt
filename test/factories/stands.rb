FactoryBot.define do
  factory :stand do
    width { 9.99 }
    height { 9.99 }
    depth { 9.99 }
    diameter { 9.99 }
    description { "MyText" }
    cooler { 1 }
    table { 1 }
    selfdriver { false }
    trailer { false }
    power { false }
    specials { "MyText" }
    misc { "MyText" }
    vendor
  end
end
