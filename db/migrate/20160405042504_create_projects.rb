class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.datetime :startDate
      t.datetime :completedDate, null: true
      t.datetime :dueDate, null: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
