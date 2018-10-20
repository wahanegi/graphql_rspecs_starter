FactoryBot.define do
  factory :comment do
    post
    body { Faker::FamousLastWords.last_words }
  end
end
