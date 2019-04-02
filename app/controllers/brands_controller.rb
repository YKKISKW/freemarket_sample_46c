class BrandsController < ApplicationController
  def index
    @brands = Brand.all.where('name LIKE(?)', "%#{params[:name]}%")
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
