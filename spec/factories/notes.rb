FactoryGirl.define do
  factory :note do
    content Faker::Lorem.paragraph

    trait :notable_client do
      association :notable, factory: :client
    end

    trait :notable_project do
      association :notable, factory: :project
    end
  end
end
