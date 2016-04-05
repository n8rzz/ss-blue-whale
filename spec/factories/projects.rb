FactoryGirl.define do
  factory :project do
    startDate Faker::Date.between(180.days.ago, Date.today)
    dueDate Faker::Date.between(90.days.ago, 5.days.ago)
    completedDate Faker::Date.between(5.days.ago, Date.today)
    client
  end
end
