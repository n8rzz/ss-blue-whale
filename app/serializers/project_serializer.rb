class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :completedDate, :dueDate

  has_one :client
  has_one :project_type
  has_many :time_entries
end
