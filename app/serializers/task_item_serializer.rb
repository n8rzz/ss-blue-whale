class TaskItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sortOrder, :startDate, :endDate

  has_many :project_types
  class ProjectTypeSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
