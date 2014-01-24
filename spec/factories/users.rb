FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    cell_phone "469-555-1212"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end
end