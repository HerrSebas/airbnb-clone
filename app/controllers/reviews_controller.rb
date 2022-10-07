class ReviewsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
    authorize @review
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params) 
    @review.flat = @flat
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
