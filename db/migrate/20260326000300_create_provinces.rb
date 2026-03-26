class CreateProvinces < ActiveRecord::Migration[8.1]
  def change
    create_table :provinces do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.decimal :gst_rate, precision: 5, scale: 3, null: false, default: 0
      t.decimal :pst_rate, precision: 5, scale: 3, null: false, default: 0
      t.decimal :hst_rate, precision: 5, scale: 3, null: false, default: 0
      t.datetime :updated_at, null: false
    end
  end
end
