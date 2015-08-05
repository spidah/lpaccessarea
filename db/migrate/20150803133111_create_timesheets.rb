class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :for_date
      t.datetime :start_time
      t.datetime :finish_time
      t.datetime :approved_start
      t.datetime :approved_finish
      t.time :approved_break
      t.time :approved_lunch

      t.timestamps null: false
    end
  end
end
