class Item < ApplicationRecord
has_many :orders, dependent: :destroy
belongs_to :user
belongs_to :category
end
