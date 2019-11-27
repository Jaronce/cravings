class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
