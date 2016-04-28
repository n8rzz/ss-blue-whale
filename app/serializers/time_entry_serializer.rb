class TimeEntrySerializer < ActiveModel::Serializer
  attributes :id, :startTime, :endTime, :duration, :task_item_id

  has_one :task_item
end
