class ListsController < ApplicationController

  def index
  end

  def new
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(name: params[:list][:name], user_id:current_user.id)
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
    p "*" * 100
    p @item = Item.new(:list => @list)

    # @fucktoy = @list.items.new
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
