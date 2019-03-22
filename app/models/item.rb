class Item < ApplicationRecord
has_many :orders, depend: :destory
belongs_to :user
end
