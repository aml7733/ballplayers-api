FactoryBot.define do
  factory :player do
    name_brief { Faker::Lorem.word }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position_id { Faker::Number.between(1, 10) }
    sport_id { Faker::Number.between(1, 2)}
    age { Faker::Number.between(18, 40) }
    average_position_age_diff { Faker::Number.decimal(1) }
  end
end
