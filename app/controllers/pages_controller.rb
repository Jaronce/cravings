class PagesController < ApplicationController

  skip_before_action :authenticate_user!

  def home
    @dishes = Dish.all
    @categories = Category.all
  end
end
