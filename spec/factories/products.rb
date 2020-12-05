FactoryBot.define do
  factory :product do
    name { Faker::Name.last_name }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    area_id { 2 }
    charge_id { 2 }
    status_id { 2 }
    send_date_id { 2 }
    price { 300 }
    association :user
  end
end
