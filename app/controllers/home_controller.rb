class HomeController < ApplicationController
  def index
    @products = Product.where("created_at >= ?", Time.now.midnight)
      .order("created_at DESC")
    @categories = Category.where("created_at >= ?", Time.now.midnight)
      .order("created_at DESC")
    @manufacturers = Manufacturer.where("created_at >= ?", Time.now.midnight)
      .order("created_at DESC")
  end
end
