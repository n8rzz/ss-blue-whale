class AddTimeEntriesToTaskItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :time_entries, :task_item, foreign_key: true
  end
end
