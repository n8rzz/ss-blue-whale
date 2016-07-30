class AddIsControllableToTaskItems < ActiveRecord::Migration[5.0]
  def change
    add_column :task_items, :isControllable, :boolean, null: false, default: true
  end
end
