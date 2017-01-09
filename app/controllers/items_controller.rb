class ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product, :quantity, :list_id)
  end

end
