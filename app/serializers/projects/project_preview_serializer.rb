class Projects::ProjectPreviewSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :completedDate, :dueDate

  has_one :client
  has_one :project_type

  # rubocop:disable Style/MethodName
  def startDate
    object.startDate.strftime('%Y-%m-%d') if object.startDate
  end

  def completedDate
    object.completedDate.strftime('%Y-%m-%d') if object.completedDate
  end

  def dueDate
    object.dueDate.strftime('%Y-%m-%d') if object.dueDate
  end
  # rubocop:enable Style/MethodName
end
