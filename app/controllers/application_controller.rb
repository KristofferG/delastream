class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def only_admin_or_current
    if !current_user.nil?
      redirect_to root_path, warning: "Du har inte tillgång" unless current_user.admin?
    else
      redirect_to root_path
    end
  end

  def only_admin
    if !current_user.nil?
      redirect_to root_path, warning: "Du har inte tillgång" unless current_user.admin?
    else
      redirect_to root_path
    end
  end

  def login(user)
      session[:user_id] = user.id
      redirect_to user
  end

end
