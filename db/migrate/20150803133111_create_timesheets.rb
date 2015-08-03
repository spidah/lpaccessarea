class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :for_date
      t.time :start_time
      t.time :finish_time
      t.time :approved_start
      t.time :approved_finish
      t.time :approved_break
      t.time :approved_lunch

      t.timestamps null: false
    end
  end
end
