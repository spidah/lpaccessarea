class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json
  
  before_action :auth_user

  def auth_user
    if params[:controller] != "home" && params[:controller] != "devise/sessions"
      redirect_to root_path if !user_signed_in?
    end
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      edit_user_registration_path
    else
      profile_index_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :name, :role_id) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :password, :password_confirmation, :current_password, :name, :role_id, :changepassword) }
  end
  
  def authorize_admin
    redirect_to profile_index_path unless current_user.role.admin?
  end
end
