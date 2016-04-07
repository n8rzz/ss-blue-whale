class TaskItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sortOrder, :startDate, :endDate
  has_one :project_type
end
