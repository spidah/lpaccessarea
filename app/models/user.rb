class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :trackable, :timeoutable
  belongs_to :role
  
  def admin?
    self.role.name == "Admin"
  end
  
  def email_required?
    false
  end
  
  validates :login, :name, :role_id, presence: true
  validates :login, uniqueness: true
end
