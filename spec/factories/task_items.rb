FactoryGirl.define do
  factory :task_item do
    sequence(:name) { Faker::App.name }
    sequence(:sortOrder, &:to_s)
    startDate Faker::Date.between(180.days.ago, 10.days.ago)
    endDate Faker::Date.between(90.days.ago, 2.days.ago)

    # project_type FactoryGirl.create_list(:project_type, 2)
    # after(:create) { task_item_id.project_type = [create(:project_type)] }
  end

  # create(:task_item_with_project_types)
  # create(:task_item_with_project_types, item_count: 10)
  factory :task_item_with_project_types, parent: :task_item do
    transient do
      project_type_count 5
    end

    after(:create) do |base_task_item, evaluator|
      create_list(:project_type, evaluator.item_count, task_items: [base_task_item])
    end
  end
end
