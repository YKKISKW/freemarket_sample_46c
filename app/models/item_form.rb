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
                      :remove_images,
                      :user_id,
                      :id

  def initialize(attr = {})
    if attr[:id] #商品のIDがある時(edit or update)
      if attr[:name] #updateの時
        attr.each do |k,v|
          self.send("#{k}=", v)
        end
      else #editの時
        @item = Item.find(attr[:id])
        item_params = @item.attributes
        item_params.each do |k,v|
          self.send("#{k}=", v) if self.methods.include?(k.to_sym)
        end
      end
    else
      super(attr)
    end
  end

  def save
    return false if invalid?
    item = Item.new(item_params)
    images.each do |i|
      item.images.new(image: i)
      item.save
    end
  end

  def update
    @item = Item.find(id)
    self.images = @item.images unless images
    return false if invalid?
    if remove_images
      remove_images.each do |r|
        @item.images.find(r).destroy
      end
    end
    unless images == @item.images
      images.each do |i|
        @item.images.new(image: i)
        @item.save
      end
    end
        @item.update(item_params)
  end

  private

  def item_params
    {
      name: name,
      description: description,
      category_id: category_id,
      brand_id: brand_id,
      status: status,
      delivery_fee: delivery_fee,
      delivery_method: delivery_method,
      prefecture_id: prefecture_id,
      delivery_date: delivery_date,
      price: price,
      user_id:user_id
    }
  end



end
