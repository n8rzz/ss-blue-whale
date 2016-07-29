class AddColumnsToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :leadTimeDays, :integer
    add_column :projects, :isRecurring, :boolean, default: false, null: false
    add_column :projects, :status, :string
  end
end
