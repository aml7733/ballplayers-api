FactoryBot.define do
  factory :position do
    title { Faker::Name.initials(2) }
    avg_age { Faker::Number.decimal(2) }
    sport_id { Faker::Number.between(1, 2) }
  end
end
