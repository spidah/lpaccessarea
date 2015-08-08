class BreaksController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def create
		btype = params[:break_type]
		btype = 1 if btype != "1" && btype != "2"
		
		@break.timesheet = current_user.active_timesheet
		@break.break_type = btype
		@break.for_date = current_user.active_timesheet.for_date
		@break.start_time = DateTime.current
		if @break.save
			redirect_to break_path(@break)
		else
			redirect_to timesheet_index_path
		end
	end
  
	def show
		if @break == nil || @break.finish_time
			redirect_to timesheet_index_path
		else
			@duration = current_user.active_timesheet.breaks.where(["break_type=?", @break.break_type]).sum(:duration) + Time.diff(DateTime.current, @break.start_time, "%s")[:diff].to_i
			@break_type = @break.break_type == 1 ? "break" : "lunch"
		end
	end
	
	def finish
		@break.finish_time = DateTime.current
		@break.duration = Time.diff(@break.start_time, @break.finish_time, "%s")[:diff]
		@break.save!
		redirect_to timesheet_index_path
	end
end
