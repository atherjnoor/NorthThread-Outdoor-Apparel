class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.string :status, null: false, default: 'new'
      t.string :province_snapshot
      t.decimal :gst_rate_snapshot, precision: 5, scale: 3
      t.decimal :pst_rate_snapshot, precision: 5, scale: 3
      t.decimal :hst_rate_snapshot, precision: 5, scale: 3
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :gst_amount, precision: 10, scale: 2
      t.decimal :pst_amount, precision: 10, scale: 2
      t.decimal :hst_amount, precision: 10, scale: 2
      t.decimal :grand_total, precision: 10, scale: 2
      t.string :stripe_payment_id
      t.string :stripe_customer_id

      t.timestamps null: false
    end
  end
end
