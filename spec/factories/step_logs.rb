FactoryBot.define do
  factory :step_log do
    footsteps {Faker::Number.between(from: 0, to: 10000000000) }
  end
end
