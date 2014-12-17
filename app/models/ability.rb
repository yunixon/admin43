class Ability
  include CanCan::Ability

  def initialize(user)

    unless user.nil?
      can :manage,     :all      if user.superadmin?
      can :manage,     User,     id: user.id
      can :read,       Resume,   status: 'published'
      can :manage,     Resume,   user_id: user.id if user.sysadmin?
      can :read,       Job,      status: 'accepted'
      can :manage,     Job,      employer_id: user.id if user.employer?
      can :read,       Event,    status: 'accepted'
      can :join,       Event,    status: 'accepted'
      can :moderating, Event,    status: 'moderating'
      can :manage,     Event,    organizer_id: user.id
      can :read,       Newsline, status: 'published'
    else
      can :read,       Event,    status: 'accepted'
      can :join,       Event,    status: 'accepted'
      can :read,       Job,      status: 'accepted'
      can :read,       Newsline, status: 'published'
    end

  end
end
