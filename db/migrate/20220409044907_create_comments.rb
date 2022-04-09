class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :comment,  null:false
      t.references :customer, null:false, foreign_key: true
      t.references :product,  null:false, foreign_key: true
      t.timestamps
    end
  end
end
