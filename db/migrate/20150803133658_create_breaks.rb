class CreateBreaks < ActiveRecord::Migration
  def change
    create_table :breaks do |t|
      t.date :for_date
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :duration
      t.integer :break_type
      t.references :timesheet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
