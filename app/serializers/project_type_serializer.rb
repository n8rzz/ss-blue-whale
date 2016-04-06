class ProjectTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dueDate, :references
end
