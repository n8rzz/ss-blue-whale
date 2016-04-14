class TaskItem < ApplicationRecord
  has_and_belongs_to_many :project_types

  accepts_nested_attributes_for :project_types

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :description, length: { minimum: 2, maximum: 160 }
  validates :sortOrder, presence: true
end
