class HomeController < ApplicationController
  def index
  end

  def create
    omniauth = request.env["omniauth.auth"]
    user = User.where(uid: omniauth['uid']).first
    if user
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    else
      session[:uid] = omniauth['uid']
      redirect_to new_user_registration_url
    end
  end

  def about_us
  end
end
