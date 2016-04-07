class CreateProjectTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_types do |t|
      t.string :name
      t.string :description
      t.datetime :dueDate, null: true

      t.timestamps
    end
  end
end
