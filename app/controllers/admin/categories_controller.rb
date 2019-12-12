class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    
    render "index"
  end

  def show
  end

  def new
  end

  def create
  end

  
end
