class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
  end

  def update
    if current_customer.update(customer_params)
      bypass_sign_in(current_customer)
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end

end
