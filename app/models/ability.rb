class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all
=begin


    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :advanced, :any
      can [:updates, :read], Proposal
      can [:updates, :read], Requeriment
    end

    if user.has_role? :auditor, :any
      can [:updates, :read], Proposal
      can :read, Proposal
    end

    if user.has_role? :supervisor, :any
      can [:updates, :read], Requeriment
      can :read, Proposal
    end

    if user.has_role? :assistant, :any
      can :read, Proposal
      can :read, Requeriment
    end

=end
  end
end
