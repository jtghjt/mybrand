class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :quantity, null:false
      t.integer    :total_price, null:false
      t.references :customer, null:false, foreign_key: true
      t.references :item, null:false, foreign_kry: true 
      t.timestamps
    end
  end
end
