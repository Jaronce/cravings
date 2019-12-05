class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index

    @category = Category.find_by("name ILIKE ?", "%#{params[:category]}%") # Japansese
    @dishes = @category.dishes # not array
    @list = @dishes.sort_by { |dish| -total_dish_votes(dish) } # array


    @other_categories = Category.where.not(id: @category.id) # [ Canadain, Korean ]
    @other_dishes = other_cat # array
    @other_list = @other_dishes.sort_by { |dish| -total_dish_votes(dish) } # array of arrayt

    # @other_list = other_cat.sort_by { |dish| -total_dish_votes(dish) }

    @addresses = selected_addresses
    @restaurant_addresses = @addresses.geocoded
    @markers = @restaurant_addresses.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: { product: product })
      }
    end
  end

  def selected_addresses
    Restaurant.joins(:dishes).where(dishes: { id: @dishes }).distinct
  end

# -------------------------------------------------------------------------------
  def other_cat
    @other_categories.map(&:dishes).flatten(1)
  end

  def total_votes
    @dishes.map do |dish|
      total_dish_votes(dish)
    end
  end

  def total_dish_votes(dish)
    dish.votes.map {|votes| votes.vote }.sum
  end

  # def other_list_order
  #   list = @other_dishes.map { |dish| dish }
  #   list == @other_dishes
  # end

  # def list_order # transfer Hash to Array
  #   list = []
  #   @dishes.each do |dish|
  #     list << dish
  #   end
  #   return list
  # end
#-------------------------------------------------------------------------------
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

  def destroy
    @dish = Dish.find(params[:id])
  end
end
