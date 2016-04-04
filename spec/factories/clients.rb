FactoryGirl.define do
  factory :client do
    name Faker::Name.name
    address_1 Faker::Address.street_address
    address_2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip_code
    fax Faker::PhoneNumber.phone_number
    phone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    website Faker::Internet.domain_name
  end
end
