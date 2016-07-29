FactoryGirl.define do
  sequence(:name) { |n| "#{Faker::App.name}-#{n}" }

  factory :client do
    name
    address_1 Faker::Address.street_address
    address_2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip_code
    fax Faker::PhoneNumber.phone_number
    phone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    website Faker::Internet.domain_name
    entity Faker::Lorem.word
    joinDate 3.years.ago
    status 'Active'
  end
end
