class TaskItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sortOrder, :startDate, :endDate

  has_many :notes
  has_many :project_types

  # rubocop:disable Style/MethodName
  def startDate
    object.startDate.to_s(:short_date) if object.startDate
  end

  def endDate
    object.endDate.to_s(:short_date) if object.endDate
  end
  # rubocop:enable Style/MethodName

  class ProjectTypeSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
