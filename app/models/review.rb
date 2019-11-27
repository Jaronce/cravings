class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  has_many :vote_reviews, dependent: :destroy
end
