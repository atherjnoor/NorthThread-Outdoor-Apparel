class CreateAddresses < ActiveRecord::Migration[8.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true

      t.string :address_line1, null: false
      t.string :address_line2
      t.string :city, null: false
      t.string :postal_code, null: false
      t.boolean :is_default, null: false, default: false
      t.datetime :created_at, null: false
    end
  end
end
