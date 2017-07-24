class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new

    can :manage, Idea do |i|
      i.user = user
    end




  end
end
