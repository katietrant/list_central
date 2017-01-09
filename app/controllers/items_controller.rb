class ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html {redirect_to list_path(list)}
      format.js { head :ok }
    end
  end


  private
  def item_params
    params.require(:item).permit(:product, :quantity, :list_id)
  end

end
