FactoryBot.define do
  factory :group do
    association :users
    id {Faker::Number.between(from: 1, to: 10)}
    name { Faker::Team.name }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
  end
end
