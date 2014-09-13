class HomeController < ApplicationController
  def index
    @products = Product.from_current_day.ordered
    @categories = Category.from_current_day.ordered
    @manufacturers = Manufacturer.from_current_day.ordered
  end
end
