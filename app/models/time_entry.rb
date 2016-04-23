class TimeEntry < ApplicationRecord
  validates :startTime, presence: true
end
