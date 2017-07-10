class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[firstname lastname address tel_num])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[firstname lastname tel_num user_address license_num description experience avatar])
  end

end
