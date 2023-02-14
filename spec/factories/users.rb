FactoryBot.define do
  factory :user do
    # id { Faker::Number.between(from: 1,to: 10) }
    email { Faker::Internet.free_email}
    name  { Faker::Name.name}
    password	 {'abcaaaaaa'}
    password_confirmation	 {'abcaaaaaa'}
    reset_password_token	{ Faker::String.random }
    reset_password_sent_at { Faker::Date.in_date_period}
    remember_created_at {Faker::Date.in_date_period}
    created_at { Faker::Date.in_date_period}
    updated_at { Faker::Date.in_date_period}
  end
end
