class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(list_params.merge(user_id: @user.id))
    if @list.save
      redirect_to user_path(@user)
    else
      redirect_to new_list_path
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = Item.new(:list => @list)
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    @list.update(list_params)

    redirect_to list_path(@list)
  end

  def destroy
    @list= List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html {redirect_to user_path(user)}
      format.js { }
    end
  end


  private
  def list_params
    params.require(:list).permit(:name)
  end

end
