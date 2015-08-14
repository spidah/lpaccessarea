class Timesheet < ActiveRecord::Base
	belongs_to :user
	has_many :breaks

	def latest_break
		self.breaks.last
	end
	
	def has_active_break?
		abreak = latest_break
		
		abreak ? abreak.currently_active? : false
	end
	
	def to_param
		for_date.strftime("%Y-%m-%d")
	end
end
