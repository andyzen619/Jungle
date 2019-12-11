class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.all

    puts "Number of products in database: #{@products.length}"
    puts "Number of categories in database: #{@categories.length}"

    render "show"

  end
end
