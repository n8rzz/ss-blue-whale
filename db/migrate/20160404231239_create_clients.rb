class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address_1, null: true
      t.string :address_2, null: true
      t.string :fax, null: true
      t.string :phone, null: true
      t.string :email, null: true
      t.string :website, null: true

      t.timestamps
    end
  end
end
