class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @dish = Dish.find(params[:dish_id])
    @favorite.user = current_user
    @favorite.dish = @dish

    @favorite.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @dish = @favorite.dish # we need `dish.id` to identify which cards to remove in the DOM.
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
