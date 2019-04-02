class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable
  has_many :social_profiles, dependent: :destroy
  has_one :credit, dependent: :destroy
  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: :item
  has_many :comments
  validates :nickname, presence: true,length: { maximum: 20 }

  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end
end
