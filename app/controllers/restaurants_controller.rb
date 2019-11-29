class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @votes = total_votes.sum
    @list = list_order.sort_by { |v| -total_dish_votes(v) }
  end

  def total_votes
    votes = []
    @restaurant.dishes.each do |dish|
      votes << total_dish_votes(dish)
    end
    return votes
  end

  def total_dish_votes(dish)
    dish.votes.map {|votes| votes.vote }.sum
  end

  def list_order
    list = []
    @restaurant.dishes.each do |dish|
      list << dish
    end
    return list
  end
end
