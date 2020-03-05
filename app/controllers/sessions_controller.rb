class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # session starts here
      login(user)
    else
      flash.now[:danger] = 'Felaktig epost/lösenord. Försök igen!'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end


end
