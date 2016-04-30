FactoryGirl.define do
  factory :client_contact do
    sequence(:name) { Faker::Name.name }
    position Faker::Name.title
    businessPhone Faker::PhoneNumber.phone_number
    mobilePhone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    association :client, factory: :client
  end
end
