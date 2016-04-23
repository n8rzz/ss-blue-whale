class TimeEntrySerializer < ActiveModel::Serializer
  attributes :id, :startTime, :endTime, :duration
end
