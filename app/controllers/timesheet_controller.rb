class TimesheetController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_timesheet
	before_filter :load_previous_timesheet, :only => [:show]
	before_filter :load_breaks, :only => [:index]
	load_and_authorize_resource
	
	def update
		@timesheet.start_time = Time.parse(starttime_params[:start_time])
		@timesheet.save!
		redirect_to timesheet_index_path
	end
	
	def index
		@totaltime = Time.diff(@timesheet.finish_time || DateTime.current, @timesheet.start_time, "%s")[:diff].to_i
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
	
	def previous
		@timesheets = current_user.timesheets.where.not(:finish_time => nil).paginate(:page => params[:page], :per_page => 14).order('id DESC')
	end
	
	protected
	
	def load_timesheet
		@timesheet = current_user.timesheets.find_by for_date: params[:id] || Date.today
	end
	
	def load_breaks
		@breaks = @timesheet.breaks.where(["break_type=?", 1])
		@lunches = @timesheet.breaks.where(["break_type=?", 2])
	end

	def starttime_params
		params.require(:timesheet).permit(:start_time)
	end
	
	def load_previous_timesheet
		@timesheet = current_user.timesheets.find_by for_date: params[:date]
		@totaltime = Time.diff(@timesheet.finish_time, @timesheet.start_time, "%s")[:diff].to_i
		@breaks = @timesheet.breaks.where(["break_type=?", 1])
		@lunches = @timesheet.breaks.where(["break_type=?", 2])
	end
end
