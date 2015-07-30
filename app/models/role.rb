class Role < ActiveRecord::Base
    has_many :users
    
    def admin?
        self.name == "Admin"
    end
end
