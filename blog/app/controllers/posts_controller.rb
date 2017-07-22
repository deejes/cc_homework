class PostsController < ApplicationController
before_action :find_post, only: [:show, :destroy, :edit, :update]
before_action :authorize_user!, only: [:edit, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comments = @post.comments
  end


  def edit
  end


  def new
    :authenticate_user!
    @post = Post.new
  end

  def create
    :authenticate_user!
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to posts_path
  end

  def update

    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:title,:body,:category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
     unless can?(:manage, @post)

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
