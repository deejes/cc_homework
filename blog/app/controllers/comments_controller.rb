class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(params[:post_id])
  end


  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end



private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
