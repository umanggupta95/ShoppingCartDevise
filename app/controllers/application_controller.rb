class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url and return
    end
  end

end
