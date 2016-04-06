class Project < ApplicationRecord
  belongs_to :client
  belongs_to :project_type
end
