FactoryGirl.define do
  factory :note do
    content Faker::Lorem.paragraph
    association :notable, factory: :client
  end
end
