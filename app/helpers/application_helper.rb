module ApplicationHelper
    def resource_name
        :user
    end
 
    def resource
        @resource ||= User.new
    end
 
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    
    def get_time(time)
        time.in_time_zone("London")
    end

	def format_time(time)
		get_time(time).strftime("%I:%M %P")
	end
	
	def text_date(date)
		date.strftime("%A #{date.day.ordinalize} %B %Y")
	end
end
