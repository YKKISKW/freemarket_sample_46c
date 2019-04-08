class CategoriesController < ApplicationController
  def index 
   
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: params[:id]).order(id: "DESC")
  end
  
end
