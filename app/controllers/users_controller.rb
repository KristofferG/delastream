class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if !current_user.nil?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

    if @user == current_user || current_user.admin
      @user = User.find(params[:id])
      @have_list = @user.have_list
    else
      redirect_to login_path
    end
    @users = User.all
  end


  def check_match
    CheckMatch.new().check_match(current_user, @users)
  end
  helper_method :check_match

  # GET /users/new
  def new
    @user = User.new
    @package = Package.all
    @have_list = HaveList.all
  end

  # GET /users/1/edit
  def edit
  #  render plain: params.inspect
    if @user == current_user || current_user.admin
      @user = User.find(params[:id])
      @package = Package.all
      @have_list = HaveList.all
    else
      redirect_to login_path
    end

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save

      login(@user)

    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json

  def destroy

    if @user == current_user || current_user.admin
    @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: '' }
        format.json { head :no_content }
      end
    else
      redirect_to login_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation, :active, :package_ids => [])
    end
end
