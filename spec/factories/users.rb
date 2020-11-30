FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = 'xxx111'
    password { password }
    password_confirmation { password }
    last_name { 'ああ' }
    first_name { 'ああ' }
    last_kana { 'アア' }
    first_kana { 'アア' }
    birthday { '1930-01-01' }
  end
end
