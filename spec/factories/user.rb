FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    street { Faker::Address.street_name }
    number { rand(999) }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    country { Faker::Address.country }
    email { Faker::Internet.email }
    password { "Password!" }
    role { %w[visitor member].sample }
  end
end
