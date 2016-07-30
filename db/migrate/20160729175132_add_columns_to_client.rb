class AddColumnsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :emailPrimary, :string
    add_column :clients, :emailSecondary, :string
    add_column :clients, :dbaName, :string
    add_column :clients, :spouseName, :string
  end
end
