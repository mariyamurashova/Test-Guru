class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  before_action :set_locale

  def default_url_options(options = {})
    (I18n.locale.to_sym.eql?(I18n.default_locale.to_sym) ? {} : {locale: I18n.locale}).merge options
  end

  def after_sign_in_path_for(user)

    if user.admin? 
      admin_root_path
    else
     flash.notice = "Привет,#{user.first_name}"       
     user_root_path
    end

  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

   def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
