class ProjectTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dueDate

  has_many :task_items

  # rubocop:disable Style/MethodName
  def dueDate
    object.dueDate.to_s(:short_date) if object.dueDate
  end
  # rubocop:enable Style/MethodName
end
