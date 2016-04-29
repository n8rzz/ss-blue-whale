class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :task_item
  belongs_to :project

  before_save :set_duration

  validates :startTime, presence: true

  def set_duration
    return if endTime.nil? && duration.nil? || duration?

    self.duration = TimeDifference.between(startTime, endTime).in_hours
    save!
  end
end
