FactoryGirl.define do
  factory :task_item do
    sequence(:name) { Faker::App.name }
    sequence(:sortOrder)
    startDate Faker::Date.between(180.days.ago, 10.days.ago)
    endDate Faker::Date.between(90.days.ago, 2.days.ago)
    association :project_type, factory: :project_type
  end
end
