class DishesController < ApplicationController
  def index
    @dishes = Dish.find_by(name: params[:dish])
    @category = Category.find_by(name: params[:category])
    @list = list_order.sort_by { |v| -total_dish_votes(v) }
  end

  def total_votes
    votes = []
      @dishes.each do |dish|
      votes << total_dish_votes(dish)
    end
    return votes
  end

  def total_dish_votes(dish)
    dish.votes.map {|votes| votes.vote }.sum
  end

  def list_order
    list = []
    @dishes.each do |dish|
      list << dish
    end
    return list
  end
#--------------------------------------------------------------------------------
  def show
    @dish = Dish.find(params[:id])
    @list = list_review_order.sort_by { |v| -total_review_votes(v) }
  end

  def list_review_order
    list = []
    @dish.reviews.each do |review|
      list << review
    end
    return list
  end

  def total_review_votes(review)
    review.vote_reviews.map {|votes| votes.vote }.sum
  end
end
