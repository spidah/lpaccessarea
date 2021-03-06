class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	respond_to :html, :json
  
	before_action :auth_user

	def auth_user
		if params[:controller] != "home" && params[:controller] != "devise/sessions"
			if !user_signed_in?
	  			redirect_to root_path
	  		else
		  		redirect_to break_path(current_user.active_timesheet.latest_break) if current_user.active_timesheet.has_active_break? && params[:controller] != "breaks"
		  	end
		end
	end
  
	before_action :configure_permitted_parameters, if: :devise_controller?
  
	def after_sign_in_path_for(resource)
		if resource.sign_in_count == 1
			edit_user_registration_path
		else
			timesheet_index_path
		end
	end
  
	def format_time_seconds(time)
		time.strftime("%I:%M:%S")
	end
	
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end
  
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :lp_name, :password, :password_confirmation, :name, :role_id) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :lp_name, :password, :password_confirmation, :current_password, :name, :role_id, :changepassword) }
	end
  
	def authorize_admin
		redirect_to timesheet_index_path unless current_user.role.admin?
	end
end
