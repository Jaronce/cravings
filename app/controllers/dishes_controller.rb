class DishesController < ApplicationController
  def index
    @dishes = Dish.all
    @category = Category.find(params[:id])
  end

  def show

  end
end
