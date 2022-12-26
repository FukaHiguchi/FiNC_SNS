class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be loggd in to access this section"
      redirect_to new_user_session_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
