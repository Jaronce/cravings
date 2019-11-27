class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @votes = total_votes
  end

  def total_votes
    tot_votes = []
    @restaurant.dishes each do |dish|
      tot_votes << dish.votes
    end
    return tot_votes
  end
end
