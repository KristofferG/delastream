class WelcomeController < ApplicationController
  def index
    if !current_user.nil?
      redirect_to users_url
    end
  end
end
