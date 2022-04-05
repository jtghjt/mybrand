class OrderDestination

  include ActiveModel::Model
  attr_accessor :quantity, :total_price, :customer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :quantity_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :total_price
    validates :customer_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is Invalid. Include hyphen(-)'}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid'}
    validates :token
  end

  def save
    order = Order.create(quantity_id: quantity_id, total_price: total_price, customer_id: customer_id, item_id: item_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end