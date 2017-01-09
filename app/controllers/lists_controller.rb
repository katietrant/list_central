class ListsController < ApplicationController

  def index
  end

  def new
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(name: params[:name], user_id:current_user.id)
    if list.save
      flash.notice = "#{list.name} has been created"
      redirect to user_list_path
    else
      flash.notice = "Your list was not saved"
      redirect_to new_user_list_path
    end
  end

  def show
    @list = List.find(params[:id])
  end


  private
  def list_params
    params.require(:list).permit(:name)
  end
end
