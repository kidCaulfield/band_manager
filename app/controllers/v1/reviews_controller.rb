class V1::ReviewsController < ApplicationController

  def create
    venue = Venue.find params[:venue_id]
    review = Review.new review_params
    review.venue = venue
    review.save
    render json: review
  end
  
  private
  def review_params
    params.require(:review).permit(:body)
  end
end
