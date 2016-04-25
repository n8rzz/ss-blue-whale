FactoryGirl.define do
  factory :time_entry do
    startTime 4.days.ago
    endTime 1.day.ago
    duration 24
    association :user, factory: :user
  end
end
