class ItemForm
    include ActiveModel::Model
  validates :images,presence: {message: "画像がありません"}
  validates :name, presence: {message:"40字以内で入力してください"},length: { maximum: 40 ,message: "40字以内で入力してください"}
  validates :description, presence: {message:"1000字以内で入力してください"},length: { maximum: 1000 ,message: "1000字以上で入力してください"}
  validates :category_id, presence: {message:"入力してください"}
  validates :brand_id, presence: {message:"入力してください"}
  validates :status, presence: {message:"入力してください"}
  validates :delivery_fee, presence: {message:"入力してください"}
  validates :delivery_date, presence: {message:"入力してください"}
  validates :delivery_method, presence: {message:"入力してください"}
  validates :prefecture_id, presence: {message:"入力してください"}
  validates :price, presence: {message:"300以上9999999以下で入力してください"}
  validates :price,numericality: { only_integer: true,greater_than: 299,less_than:10000000 ,message:"300以上9999999以下で入力してください"}

  attr_accessor       :name,
                      :description,
                      :category_id,
                      :brand_id,
                      :status,
                      :delivery_fee,
                      :delivery_method,
                      :prefecture_id,
                      :delivery_date,
                      :price,
                      :images,
                      :user_id

  def save
    return false if invalid?
    item = Item.new(name: name,description: description,category_id: category_id,brand_id: brand_id,status: status,delivery_fee: delivery_fee,delivery_method: delivery_method,prefecture_id: prefecture_id,delivery_date: delivery_date,price: price,user_id:user_id)
    images.each do |i|
      item.images.new(image: i)
      item.save
    end
  end


end
