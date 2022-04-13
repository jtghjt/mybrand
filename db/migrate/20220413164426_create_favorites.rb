class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:customer_id, :item_id], unique: true
  end
end
