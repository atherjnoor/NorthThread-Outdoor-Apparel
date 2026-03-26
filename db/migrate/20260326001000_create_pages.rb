class CreatePages < ActiveRecord::Migration[8.1]
  def change
    create_table :pages do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :updated_at, null: false
    end

    add_index :pages, :slug, unique: true
  end
end
