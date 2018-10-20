FactoryBot.define do
  factory :post do
    user
    body { Faker::Restaurant.review }
  end
end
