class AddColumnsToProjectType < ActiveRecord::Migration[5.0]
  def change
    add_column :project_types, :nextRecurringDate, :datetime
    add_column :project_types, :recurringSchedule, :string
    add_column :project_types, :repeatWhenComplete, :boolean, default: false, null: false
  end
end
