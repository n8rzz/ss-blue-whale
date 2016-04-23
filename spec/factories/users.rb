FactoryGirl.define do
  factory :user do
    username Faker::Lorem.characters(6)
    email Faker::Internet.email
    access_token Devise.friendly_token
    password '12345678'
    password_confirmation '12345678'
  end

  factory :session_request, parent: :user do
    email Faker::Internet.email
    password '12345678'
  end
end
