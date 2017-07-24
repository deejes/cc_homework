class IdeasController < ApplicationController

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find params[:id]
    @review = Review.new
    @reviews = Review.order(created_at: :desc)

  end

  def create
    @idea = Idea.new get_idea_params
    @idea.user = current_user
    @idea.save
    redirect_to ideas_path
  end

  def edit
    if authorize_user!
      @idea = Idea.find params[:id]
    else
      redirect_to ideas_path
    end
  end

  def update
    authorize_user!
    @idea = Idea.find params[:id]
    @idea.update get_idea_params
    redirect_to ideas_path
  end

  def destroy
    # byebug
    if authorize_user!
    @idea = Idea.find params[:id]
    @idea.destroy
    redirect_to ideas_path
    else
      redirect_to ideas_path
    end

  end


private

  def get_idea_params
    params.require(:idea).permit(:title, :description)
  end
  def authorize_user!
    @idea = Idea.find params[:id]
    @idea.user == current_user
  end
end
