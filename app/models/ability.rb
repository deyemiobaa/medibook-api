class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Appointment
    return unless user.admin?

    can :manage, :all
  end
end
