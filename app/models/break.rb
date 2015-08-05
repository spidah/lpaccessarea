class Break < ActiveRecord::Base
  belongs_to :timesheet
  
  def currently_active?
  	self.finish_time ? false : true
  end
end
