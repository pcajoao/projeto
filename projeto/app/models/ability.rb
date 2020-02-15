class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :user
      can :manage,  :user ,user_id: user.id
      can :manage,  :comment ,user_id: user.id
      can :read, :all
    else
      can :read, :all
    
    end
  end
end
