class Product < ApplicationRecord
  has_many :comments

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
  end
end
