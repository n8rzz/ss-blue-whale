FactoryGirl.define do
  factory :task_item do
    sequence(:name) { |n| "#{Faker::App.name}-#{n}" }
    sequence(:sortOrder, &:to_s)
    description Faker::Lorem.sentence
    startDate Faker::Date.between(180.days.ago, 10.days.ago)
    endDate Faker::Date.between(90.days.ago, 2.days.ago)
  end

  # create(:task_item_with_project_types)
  # create(:task_item_with_project_types, project_type_count: 10)
  factory :task_item_with_project_types, parent: :task_item do
    transient do
      project_type_count 2
    end

    after(:create) do |base_task_item, evaluator|
      create_list(:project_type, evaluator.project_type_count, task_items: [base_task_item])
    end
  end
end
