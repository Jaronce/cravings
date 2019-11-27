class VoteReviewsController < ApplicationController
  def create
    @vote_review = VoteReview.new
    @review = Review.find(params[:review_id])
    @vote_review.user = current_user
    @vote_review.review = @review
    @vote_review.vote = params[:vote].to_i
    @vote_review.save
    redirect_back(fallback_location: root_path)
  end
end
