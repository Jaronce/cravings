class Vote < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  enum selectable_vote: [:upvote, :downvote]
end
