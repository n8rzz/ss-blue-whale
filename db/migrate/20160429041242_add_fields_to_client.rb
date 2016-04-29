class AddFieldsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :entity, :string
    add_column :clients, :status, :string
    add_column :clients, :joinDate, :datetime, null: false
  end
end
