class ItemsController < ApplicationController

  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result
  end
end
