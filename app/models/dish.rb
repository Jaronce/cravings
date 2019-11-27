class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :votes, dependent: :destroy
  has_many :votants, through: :votes
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
