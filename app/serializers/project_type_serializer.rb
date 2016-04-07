class ProjectTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dueDate

  has_many :task_items
end
