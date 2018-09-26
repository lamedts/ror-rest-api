FactoryBot.define do
  factory :origin do
    association :order
    latitude { Faker::Number.number(2) }
    longtitude { Faker::Number.number(2) }
  end
end