class CreateTaskItems < ActiveRecord::Migration[5.0]
  def change
    create_table :task_items do |t|
      t.string :name
      t.string :description
      t.integer :sortOrder, :default => 0
      t.datetime :startDate, null: true
      t.datetime :endDate, null: true
      t.references :project_type, foreign_key: true

      t.timestamps
    end
  end
end
