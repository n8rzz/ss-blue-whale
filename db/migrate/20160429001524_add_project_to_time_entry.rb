class AddProjectToTimeEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :time_entries, :project, foreign_key: true
  end
end
