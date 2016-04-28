require 'faker'
require 'securerandom'

Client.create(
  name: Faker::Name.name,
  address_1: Faker::Address.street_address,
  address_2: Faker::Address.secondary_address,
  city: Faker::Address.city,
  state: Faker::Address.state_abbr,
  zip: Faker::Address.zip_code,
  fax: Faker::PhoneNumber.phone_number,
  phone: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email,
  website: Faker::Internet.domain_name
)

ProjectType.create(
  name: Faker::Lorem.word,
  description: Faker::Lorem.sentence,
  dueDate: Faker::Date.between(90.days.ago, 5.days.ago)
)

User.create(
  email: 'johndoe@example.com',
  username: 'johndoe',
  password: 'password',
  password_confirmation: 'password'
)
