class Product < ApplicationRecord
  has_many :comments

  with_options presence: true do
    validates :name
    validates :description
  end
end
