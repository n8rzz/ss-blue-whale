class TimeEntrySerializer < ActiveModel::Serializer
  attributes :id, :startTime, :endTime, :duration

  belongs_to :task_item
  belongs_to :project
end
