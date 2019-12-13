class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_PRODUCTS_USERNAME_KEY'], password: ENV['ADMIN_PRODUCTS_PASSWORD_KEY']
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.all

    puts "Number of products in database: #{@products.length}"
    puts "Number of categories in database: #{@categories.length}"

    render "show"

  end
end
