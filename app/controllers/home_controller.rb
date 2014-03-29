class HomeController < ApplicationController
  def index
    @categories = Category.where("created_at >= :start_date", :start_date => Time.now.midnight).order("created_at DESC")
  end
end
