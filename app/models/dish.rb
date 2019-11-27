class Dish < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :votes, dependent: :destroy
  has_many :votants, through: :votes
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def new_dish(input_restaurant, input_category)
    dish.restaurant = input_restaurant
    dish.category = input_category
    dish.save!
  end
end
