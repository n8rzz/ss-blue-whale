class ProjectTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dueDate, :nextRecurringDate,
             :recurringSchedule, :repeatWhenComplete

  has_many :task_items

  # rubocop:disable Style/MethodName
  def dueDate
    object.dueDate.to_s(:short_date) if object.dueDate
  end

  def nextRecurringDate
    object.nextRecurringDate.to_s(:short_date) if object.nextRecurringDate
  end
  # rubocop:enable Style/MethodName
end
