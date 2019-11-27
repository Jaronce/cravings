class DishesController < ApplicationController
  def index
    @dishes = Category.find_by(name: params[:category]).dishes
    @category = Category.find_by(name: params[:category])
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
