class Category < ApplicationRecord
  belongs_to :budget
  has_many   :item_categories

  has_many :items, through: :item_categories
end
