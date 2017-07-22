class CommentsController < ApplicationController
  before_action :authorize_user!, only: [:destroy]

  def create
    :authenticate_user!
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    @comment.save
    redirect_to post_path(params[:post_id])
  end


  def new
    :authenticate_user!
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end



private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user!
     unless can?(:manage, @comment)

    # if @question.user != current_user
      redirect_to root_path, alert: 'Access denied'

      # head will send an empty HTTP response, it takes one argument as a symbol
      # and the argument will tell Rails to send the desired HTTP response code
      # 	:unauthorized -> 401
      # you can see more code on this page:
      # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
      # head :unauthorized
    end
  end

end
