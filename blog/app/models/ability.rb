

class Ability
  include CanCan::Ability
  # we dont need to initialize an instance of the ability class ourselves. this is
  # automatically done by the gem. we only need to make sure we have a mehtod in the
  #current_user controller that return an object of the currently logged in user. (
  # we already have that  )
  def initialize(user)
    # user -> current_user
#     # if the user is not signed in then `user` will be `nil`
#
#     # it usually recommended that you initialize the `user` argument to a new
#     # User so we don't have to check if `user` is nil all the time.
#     user ||= User.new
#
#
# # this says if is_admin returns true, the user can do any action to any model in the app.
    # if user.is_admin?
    #   can :manage , :all
    # end


    can :manage, Post do |post|
      post.user == user
    end
#

#
    can :destroy, Comment do |comment|
      comment.user == user || comment.post.user == user
    end

    end
end
