class AddNotableReferencesToNotes < ActiveRecord::Migration[5.0]
  def change
    change_table :notes do |t|
      t.references :notable, polymorphic: true, index: true
    end
  end
end
