class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_data_read, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
  end

  private

  def item_data_read
    @item = Item.find(params[:id])
  end
end
