class DishesController < ApplicationController
  def index
    @dishes = Dish.find_by(name: params[:dish])
    @category = Category.find_by(name: params[:category])
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
