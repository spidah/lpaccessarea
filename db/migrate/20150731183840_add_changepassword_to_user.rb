class AddChangepasswordToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.boolean :changepassword,              null: false, default: true
    end
  end
end
