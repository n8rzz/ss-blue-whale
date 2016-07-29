class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :completedDate, :dueDate, :status, :leadTimeDays, :isRecurring

  has_one :client
  has_one :project_type
  has_many :time_entries
  has_many :notes

  # rubocop:disable Style/MethodName
  def startDate
    object.startDate.to_s(:short_date) if object.startDate
  end

  def completedDate
    object.completedDate.to_s(:short_date) if object.completedDate
  end

  def dueDate
    object.dueDate.to_s(:short_date) if object.dueDate
  end
  # rubocop:enable Style/MethodName
end
