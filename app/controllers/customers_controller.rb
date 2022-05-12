class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @nickname = current_customer.nickname
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
    @customer = current_customer
  end
end
