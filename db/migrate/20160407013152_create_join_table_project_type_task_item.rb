class CreateJoinTableProjectTypeTaskItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :project_types, :task_items, id: false do |t|
      t.index [:project_type_id, :task_item_id], name: 'project_type_task_item'
      t.index [:task_item_id, :project_type_id], name: 'task_item_project_type'
    end
  end
end
