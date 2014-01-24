require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    cell_phone { Faker::PhoneNumber::phone_number }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"

    factory :invalid_user do
      email nil
    end
  end
end
