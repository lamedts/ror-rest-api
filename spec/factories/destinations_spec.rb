FactoryBot.define do
  factory :destinations do
    latitude { Faker::Number.number(10) }
    longtitude { Faker::Number.number(10) }
  end
end