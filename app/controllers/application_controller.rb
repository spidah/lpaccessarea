class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  respond_to :html, :json
  
  before_filter :auth_user

  def auth_user
    if params[:controller] != "home"
      redirect_to root_path unless user_signed_in?
    end
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :name, :role_id) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :password, :password_confirmation, :current_password, :name, :role_id) }
  end
  
  def authorize_admin
    redirect_to root_path unless current_user.role.admin?
  end
end
