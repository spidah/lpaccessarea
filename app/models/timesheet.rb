class Timesheet < ActiveRecord::Base
  belongs_to :breaks
  belongs_to :lunches
end
