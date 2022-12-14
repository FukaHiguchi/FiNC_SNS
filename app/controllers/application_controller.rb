class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be loggd in to access this section"
      redirect_to new_user_session_path
  end
end
end
