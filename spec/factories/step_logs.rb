FactoryBot.define do
  factory :step_log do
    association :user
    id { Faker::Number.between(from: 1,to: 10) }
    day { Faker::Date.in_date_period }
    footsteps {Faker::Number.between(from: 0, to: 10000000000) }
    distant {Faker::Number.decimal(l_digits: 5, r_digits: 1) }
    burned_calorie { Faker::Number.number(digits: 7) }
    duration { Faker::Number.decimal(l_digits: 3, r_digits: 1 ) }
    created_at { Faker::Date.in_date_period }
    updated_at { Faker::Date.in_date_period }

  end
end
