FactoryGirl.define do
  factory :project_type do
    sequence(:name) { |n| "Names#{n}" }
    description Faker::Lorem.sentence
    dueDate Faker::Date.between(90.days.ago, 5.days.ago)
  end

  # create(:project_type_with_tasks)
  # create(:project_type_with_tasks, item_count: 10)
  factory :project_type_with_tasks, parent: :project_type do
    transient do
      item_count 5
    end

    after(:create) do |base_project_type, evaluator|
      create_list(:task_item, evaluator.item_count, project_type: [base_project_type])
    end
  end
end
