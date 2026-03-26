class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :stock_quantity, null: false, default: 0
      t.boolean :on_sale, null: false, default: false
      t.decimal :sale_price, precision: 8, scale: 2
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
