class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @votes = total_votes.sum
  end

  def total_votes
    votes = []
    @restaurant.dishes.each do |dish|
      votes << dish.votes.map {|vote| vote.vote }.sum
    end
    return votes
  end
end
