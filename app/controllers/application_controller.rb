class ApplicationController < ActionController::Base
 # protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id,:first_name, :last_name, :phone, :country, :state, :birthdate, :position, :work, :email, :password, :password_confirmation, :ci])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:id,:first_name, :last_name, :phone, :country, :state, :birthdate, :position, :work, :email, :password, :password_confirmation, :ci])
  end

  def user_auth
		redirect_to "/" unless  user_signed_in?
  end
end
