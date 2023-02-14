FactoryBot.define do
  factory :favorite do
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }
    association :user
    association :step_log
  end
end
