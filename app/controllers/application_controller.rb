class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :store_action
  
  def store_action
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, users_path)
    end
  end

  def store_action
    return unless request.get? 
    if (request.path != "/providers/sign_in" &&
        request.path != "/providers/sign_up" &&
        request.path != "/providers/password/new" &&
        request.path != "/providers/password/edit" &&
        request.path != "/providers/confirmation" &&
        request.path != "/providers/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:provider, providers_path)
    end
  end

end
