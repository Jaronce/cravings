class VoteReviewsController < ApplicationController
  def create
    @vote_review = VoteReview.new
    @review = Review.find(params[:review_id])
    @vote_review.user = current_user
    @vote_review.review = @review
    @vote_review.vote = params[:vote].to_i
    @vote_review.save

    if @vote_review.vote > 0
      @upvote = true
    else
      @upvote = false
    end


    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js  # <-- will render `app/views/votes/create.js.erb`
    end
  end
end
