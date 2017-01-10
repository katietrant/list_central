class ListsController < ApplicationController

  def index
  end

  def new
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(list_params.merge(user_id: @user.id))
    if @list.save
      flash.notice = "#{@list.name} has been created"
      redirect_to user_path(@user)
    else
      flash.notice = "Your list was not saved"
      redirect_to new_list_path
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = Item.new(:list => @list)
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
