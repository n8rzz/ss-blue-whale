require 'rails_helper'

describe ProjectTypesTaskItem, type: :model do
  it { should belong_to(:task_item) }
  it { should belong_to(:project_type) }

  it { should have_db_column(:task_item_id) }
  it { should have_db_column(:project_type_id) }
end
