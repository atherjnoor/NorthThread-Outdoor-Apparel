class CreateDiscountCodes < ActiveRecord::Migration[8.1]
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.integer :discount_percentage
      t.boolean :active
      t.datetime :expires_at

      t.timestamps
    end
  end
end
