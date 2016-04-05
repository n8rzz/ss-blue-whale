class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :completedDate, :dueDate
  has_one :client
end
