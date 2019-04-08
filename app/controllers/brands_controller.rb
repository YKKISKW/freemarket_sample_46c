class BrandsController < ApplicationController
  

  def show
    @brand = Brand.find(params[:id])
    @items = Item.where(brand_id: params[:id]).order(id: "DESC")

  end
end
