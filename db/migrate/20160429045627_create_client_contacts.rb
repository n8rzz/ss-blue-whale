class CreateClientContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :client_contacts do |t|
      t.string :position
      t.string :name, null: false
      t.string :businessPhone
      t.string :mobilePhone
      t.string :email

      t.timestamps
    end
  end
end
