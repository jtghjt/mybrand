class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # テーブルアソシエーション
  has_many :item_orders
  has_many :item, through: :item_orders

  has_many :favorites
  has_many :carts

  # アクティブハッシュアソシエーション
  belongs_to :category
  belongs_to :color
  belongs_to :size

  #アクティブストレージ
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :color_id
    validates :size_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :color_id
    validates :size_id
  end

end

