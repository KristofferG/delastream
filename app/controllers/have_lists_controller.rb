class HaveListsController < ApplicationController

  def show
    @have_list = HaveList.find(params[:id])
  end

  def edit
    #render plain: params.inspect
    @user = User.find(params[:id])
    @have_list = @user.have_list
  end

  def create
  #  render plain: params.inspect
    @user = current_user
    @have_list = @user.have_lists.create(have_list_params)
    redirect_to have_list_path(@have_list)
  end

  def new
    #render plain: params.inspect
   @have_list = HaveList.new
   @user = User.find(params[:format])
  end

  def update
  #  render plain: params.inspect

    @have_list = HaveList.find(params[:id])

    if @have_list.update(have_list_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @have_list = @user.have_list.find(params[:id])
    @have_list.destroy
    redirect_to user_path(@user)
  end

  private
    def have_list_params
      params.require(:have_list).permit(:comment, :package_ids =>[])
    end

end
