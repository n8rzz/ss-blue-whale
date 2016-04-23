class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.datetime :startTime, null: false
      t.datetime :endTime
      t.integer :duration

      t.timestamps
    end
  end
end
