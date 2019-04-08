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
  has_many :orders
  validates :nickname, presence: true,length: { maximum: 20 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end
end
