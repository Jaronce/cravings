class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @dish = Dish.find(params[:dish_id])
    @vote.user = current_user
    @vote.dish = @dish
    @vote.vote = params[:vote].to_i
    @vote.save

    if @vote.vote > 0
      @upvote = true
    else
      @upvote = false
    end


    respond_to do |format|
      format.html { redirect_to dish_path(@dish) }
      format.js  # <-- will render `app/views/votes/create.js.erb`
    end
  end
end
