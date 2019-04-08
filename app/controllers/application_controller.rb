class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_categories
  before_action :set_brands

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
  end

  def configure_permitted_parameters
    # binding.pry
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name,:last_name,:first_name_kana,:last_name_kana,:year, :month, :day])
  end



  def set_categories
    @categories = Category.all.includes([middle_categories: :lower_categories])
    @middle_categories = MiddleCategory.all.where(category_id: params[:category_id])
    @lower_categories = LowerCategory.all.where(middle_category_id: params[:middle_category_id])
  end

  def set_brands
    @brands = Brand.all.where('name LIKE(?)', "%#{params[:name]}%")
  end



end
