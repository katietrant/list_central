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
  end


  private
  def list_params
    params.require(:list).permit(:name)
  end
end
