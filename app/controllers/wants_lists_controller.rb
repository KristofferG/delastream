class WantsListsController < ApplicationController

  def show
    @wants_list = WantsList.find(params[:id])
  end

  def edit
    #render plain: params.inspect
    @user = User.find(params[:id])
    @wants_list = @user.wants_list
  end

  def create
  #  render plain: params.inspect
    @user = User.find(params[:user_id])
    @wants_list = @user.wants_lists.create(wants_list_params)
    redirect_to wants_list_path(@wants_list)
  end

  def new
    #render plain: params.inspect
   @wants_list = WantsList.new
   @user = User.find(params[:format])
  end

  def update
  #  render plain: params.inspect

    @wants_list = WantsList.find(params[:id])

    if @wants_list.update(wants_list_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @wants_list = @user.wants_list.find(params[:id])
    @wants_list.destroy
    redirect_to user_path(@user)
  end

  private
    def wants_list_params
      params.require(:wants_list).permit(:comment, :package_ids =>[])
    end

end
