FactoryGirl.define do
  sequence :username do
    Faker::Lorem.characters(6)
  end

  sequence :email do
    Faker::Internet.email
  end

  factory :user do
    username
    email
    access_token Devise.friendly_token
    password '12345678'
    password_confirmation '12345678'
  end

  factory :session_request, parent: :user do
    email Faker::Internet.email
    password '12345678'
  end
end
