class ItemsController < ApplicationController

  def new
    @list= List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list= List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      flash[:danger] = "Item did not save"
      redirect_to list_path(@list)
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find_by(id: params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find_by(id: params[:id])
    @item.update(item_params)

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
