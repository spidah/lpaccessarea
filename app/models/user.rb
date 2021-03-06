class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :trackable, :timeoutable
  belongs_to :role
  has_many :timesheets
  
  def admin?
    self.role.name == "Admin"
  end
  
  def email_required?
    false
  end
  
  def active_timesheet
    timesheet = self.timesheets.find_by for_date: Date.today
    
    if timesheet == nil
      previous_timesheet = self.timesheets.last
      if previous_timesheet != nil
        Rails.logger.debug previous_timesheet.id
        previous_timesheet.finish_time = previous_timesheet.start_time.in_time_zone("London").end_of_day if previous_timesheet.finish_time == nil
        previous_timesheet.save
      end
      
      
			timesheet = Timesheet.new
			timesheet.user_id = self.id
			timesheet.for_date = Date.today
			timesheet.start_time = self.current_sign_in_at.to_date == Date.today ? self.current_sign_in_at : DateTime.current
			timesheet.save
		end
		
		timesheet
  end
  
  def has_previous_timesheets?
    self.timesheets.count(:all) > 1
  end
  
  validates :login, :name, :role_id, presence: true
  validates :login, uniqueness: true
end
