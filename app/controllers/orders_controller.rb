class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :item_data_read, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_data_read
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:psotcode, :prefecture_id, :city, :block, :building, :phone_number).merge(customer_id: current_customer.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
