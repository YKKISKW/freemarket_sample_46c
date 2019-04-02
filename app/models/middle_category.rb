class MiddleCategory < ApplicationRecord
  has_many :items
  has_many :lower_categories
  belongs_to :category
end
