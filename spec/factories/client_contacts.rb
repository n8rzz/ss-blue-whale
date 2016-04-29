FactoryGirl.define do
  sequence :contact_name do
    Faker::Name.name
  end

  factory :client_contact do
    name Faker::Name.name
    position Faker::Name.title
    businessPhone Faker::PhoneNumber.phone_number
    mobilePhone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
  end
end
