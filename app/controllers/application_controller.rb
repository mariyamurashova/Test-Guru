class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_in_path_for(user)
    
    if current_user.is_a?(Admin) 
      admin_tests_path
    else
      flash.notice = "Привет,#{current_user.first_name}"
      root_path
    end

  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
