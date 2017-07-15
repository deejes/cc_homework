class PostsController < ApplicationController
before_action :find_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comments = @post.comments
  end


  def edit
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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
end
