class ProductsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = @item.comments.includes(:customer)
    @comment = Comment.new
  end
end
