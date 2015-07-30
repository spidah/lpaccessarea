class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable
  belongs_to :role
  
  #attr_accessor :login
  
  #def self.find_for_database_authentication(warden_conditions)
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:login)
  #    where(conditions.to_hash).where(["lower(login) = :value", { :value => login.downcase }]).first
  #  else
  #    where(conditions.to_hash).first
  #  end
  #end
  
  #validates :login,
  #:presence => true,
  #:uniqueness => {
  #  :case_sensitive => false
  #}
end
