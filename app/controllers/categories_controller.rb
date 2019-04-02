class CategoriesController < ApplicationController
  def index
    @categories = Category.all.includes([middle_categories: :lower_categories])

    
  end

  def show
  end
  


end
