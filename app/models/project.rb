class Project < ApplicationRecord
  has_many :time_entries
  belongs_to :client
  belongs_to :project_type
end
