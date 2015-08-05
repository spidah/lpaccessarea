class Timesheet < ActiveRecord::Base
	has_many :breaks

	def latest_break
		self.breaks.last
	end
	
	def has_active_break?
		abreak = latest_break
		
		abreak ? abreak.currently_active? : false
	end
end
