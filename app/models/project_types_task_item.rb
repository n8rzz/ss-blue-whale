class ProjectTypesTaskItem < ApplicationRecord
  belongs_to :project_type
  belongs_to :task_item
end
