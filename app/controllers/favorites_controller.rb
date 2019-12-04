class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @dish = Dish.find(params[:dish_id])
    @favorite.user = current_user
    @favorite.dish = @dish

    if @favorite.save!
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy!

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def toggle
    # delete favorite
    if params[:favorite_id]
      @favorite = Favorite.find(params[:favorite_id])
      @favorite.destroy!
      @dish = Dish.new

      @destroy = true

      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else # create favorite
      @favorite = Favorite.new
      @dish = Dish.find(params[:dish_id])
      @favorite.user = current_user
      @favorite.dish = @dish
      @favorite.save!

      @destroy = false

      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  private

  def favorite_params
    params.require(:favorites).permit(:dish_id, :favorite_id)
  end
end
