class ChangeJoinDateToNotNUll < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :joinDate, :datetime, null: true
  end
end
