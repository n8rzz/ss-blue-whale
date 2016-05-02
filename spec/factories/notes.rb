FactoryGirl.define do
  factory :note do
    content Faker::Lorem.paragraph

    trait :notable_client do
      association :notable, factory: :client
    end
  end
end
