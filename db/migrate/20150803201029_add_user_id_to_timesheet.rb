class AddUserIdToTimesheet < ActiveRecord::Migration
	def change
		change_table(:timesheets) do |t|
			t.references :user, index: true, foreign_key: true
	    end
	end
end
