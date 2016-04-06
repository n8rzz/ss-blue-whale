FactoryGirl.define do
  factory :project_type do
    name Faker::Lorem.word
    description Faker::Lorem.sentence
    dueDate Faker::Date.between(90.days.ago, 5.days.ago)
  end
end
