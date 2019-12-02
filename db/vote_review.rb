def vote_review(user, review)
  vote_review = VoteReview.new(vote: 1)
  vote_review.review = review
  vote_review.user = user
  vote_review.save!
end
