class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :votes
  has_many :reviews
end
