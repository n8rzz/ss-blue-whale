class TaskItem < ApplicationRecord
  has_many :project_types_task_items
  has_many :project_types, :through => :project_types_task_items
  has_many :time_entries

  accepts_nested_attributes_for :project_types

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :description, length: { minimum: 2, maximum: 160 }
  validates :sortOrder, presence: true
end
