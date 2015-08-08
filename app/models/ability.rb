class Ability
    include CanCan::Ability

    def initialize(user)
        if user.admin?
            can :manage, :all
        else
            can :read, Timesheet, :user_id => user.id
            can :create, Break
            can [:read, :finish], Break do |b|
                b.timesheet.user_id == user.id
            end
        end
    end
end
