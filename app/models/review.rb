class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  has_many :vote_reviews, dependent: :destroy

  def date
    min_date = Time.now - 4.years
    max_date = Time.now - 0.year
    rand(min_date..max_date).to_s[0..9]
  end
end
