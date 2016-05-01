FactoryGirl.define do
  factory :note do
    content Faker::Lorem.paragraph
    association :notable, factory: :client
  end

  factory :note_content, parent: :note do
    content Faker::Lorem.paragraph
  end
end
