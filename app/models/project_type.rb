class ProjectType < ApplicationRecord
  has_many :projects
  has_many :project_types_task_items
  has_many :task_items, :through => :project_types_task_items

  accepts_nested_attributes_for :task_items

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :description, length: { minimum: 2, maximum: 160 }
end
