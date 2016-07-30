class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :task_item, inverse_of: :time_entries
  belongs_to :project, inverse_of: :time_entries

  after_save :set_duration

  validates :startTime, presence: true
  validate :start_time_is_greater_than_end_time

  def start_time_is_greater_than_end_time
    return if endTime.blank?
    errors.add(:endTime, 'EndTime must be after StartTime') if endTime < startTime
  end

  def set_duration
    return if endTime.nil?

    update_column(:duration, TimeDifference.between(startTime, endTime).in_minutes)
  end
end
