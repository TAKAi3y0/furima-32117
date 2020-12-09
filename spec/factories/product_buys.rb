FactoryBot.define do
  factory :product_buy do
    zipcode { '123-4567' }
    area_id { 2 }
    city { '名古屋市' }
    street { '青山１−１' }
    building { 'ハイツ３号室' }
    phone { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :product
  end
end
