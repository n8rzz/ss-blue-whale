FactoryGirl.define do
  factory :note do
    content Faker::Lorem.paragraph

    trait :notable_client do
      association :notable, factory: :client
    end
  end

  factory :note_content, parent: :note do
    content Faker::Lorem.paragraph
  end
end
