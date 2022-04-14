class FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    Favorite.create(customer_id: current_customer.id, item_id: params[:id])
    redirect_back fallback_location: root_path
  end

  def destroy
    favorite = Favorite.find_by(customer_id: current_customer.id, item_id: params[:id])
    favorite.destroy
    redirect_back fallback_location: root_path
  end

end