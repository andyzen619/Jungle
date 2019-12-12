class CategoriesController < ApplicationController
  
  def index

  end

  def create

  end

  def new

  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
