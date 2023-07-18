class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?

  def after_sign_in_path_for(user)
byebug
    if user.admin? 
     admin_tests_path
    else
      flash.notice = "Привет,#{user.first_name}"       
      root_path
    end

  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
