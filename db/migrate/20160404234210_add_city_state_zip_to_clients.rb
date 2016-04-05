class AddCityStateZipToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :zip, :string
  end
end
