class ReviewsController < ApplicationController


  def create
    @idea = Idea.find params[:idea_id]
    @review = @idea.reviews.build(review_params)
    @review.user = current_user
    @review.save
    @reviews = Review.order(created_at: :desc)
    redirect_to idea_path(@idea)
    end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to idea_path(review.idea)


  end

  private
  def review_params
    params.require(:review).permit(:body)
  end

end
