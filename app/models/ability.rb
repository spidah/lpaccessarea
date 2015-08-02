class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      #can :read, Profile, :user_id => user.id
    end
  end
end
