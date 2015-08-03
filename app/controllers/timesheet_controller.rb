class TimesheetController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_and_check_data
	
	protected
	
	def load_and_check_data
		@timesheet = Timesheet.find_by for_date: Date.today
		
		if @timesheet == nil
			@timesheet = Timesheet.new
			@timesheet.for_date = Date.today
			@timesheet.start_time = current_user.current_sign_in_at.to_date == Date.today ? current_user.current_sign_in_at : DateTime.current
			@timesheet.save
		end
	end
end
