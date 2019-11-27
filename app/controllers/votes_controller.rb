class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @dish = Dish.find(params[:dish_id])
    @vote.user = current_user
    @vote.dish = @dish
    @vote.vote = params[:vote].to_i
    @vote.save
    redirect_to dish_path(@dish)
  end
end
