class Item < ApplicationRecord
  has_many :item_orders
  has_many :item, through: :item_orders

  has_many :favorites
  has_many :carts

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :color_id
    validates :size_id
    validates :price
  end
end
