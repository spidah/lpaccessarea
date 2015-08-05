class TimesheetController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_timesheet
	before_filter :load_breaks, :only => [:index]
	load_and_authorize_resource
	
	def update
		@timesheet.start_time = Time.parse(starttime_params[:start_time])
		@timesheet.save!
		redirect_to timesheet_index_path
	end
	
	def index
	end
	
	def finishshift
		@timesheet.finish_time = DateTime.current
		@timesheet.save
		redirect_to timesheet_index_path
	end
	
	def reopenshift
		@timesheet.finish_time = nil
		@timesheet.save
		redirect_to timesheet_index_path
	end
	
	protected
	
	def load_timesheet
		@timesheet = Timesheet.find_by for_date: Date.today
	end
	
	def load_breaks
		@breaks = @timesheet.breaks.find_by break_type: 1
		@lunches = @timesheet.breaks.find_by break_type: 2
	end

	def starttime_params
		params.require(:timesheet).permit(:start_time)
	end
end
