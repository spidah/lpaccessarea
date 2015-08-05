module TimesheetHelper
	def format_time(time)
		time.strftime("%I:%M %P")
	end
	
	def text_date(date)
		date.strftime("%A #{date.day.ordinalize} %B %Y")
	end
end
