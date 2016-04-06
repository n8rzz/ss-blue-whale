class ProjectType < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 30 }
  validates :description, length: { minimum: 2, maximum: 160 }
end
