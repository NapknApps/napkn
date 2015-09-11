class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_devise_params, if: :devise_controller?

  def new_session_path(scope)
    new_user_session_path
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :activities_last_viewed)
    end
  end


  def after_sign_in_path_for(resource)
    session["user_return_to"] || app_ideas_path
  end

end
