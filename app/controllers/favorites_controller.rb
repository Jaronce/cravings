class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @dish = Dish.find(params[:dish_id])
    @favorite.user = current_user
    @favorite.dish = @dish

    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
