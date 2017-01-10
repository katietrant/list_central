class ItemsController < ApplicationController


  def new
    @list= List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list= List.find(params[:list_id])
    @item = @list.items.create(item_params)
    p @item.errors.full_messages
    redirect_to list_path(@list)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html {redirect_to list_path(list)}
      format.js { }
    end
  end


  private
  def item_params
    params.require(:item).permit(:product, :quantity)
  end

end
