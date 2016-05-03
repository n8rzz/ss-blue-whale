class Projects::ProjectPreviewSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :completedDate, :dueDate

  has_one :client
  has_one :project_type
end
