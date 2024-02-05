class Item < ApplicationRecord
  belongs_to :budget
  has_many :item_categories
  has_many :item_transactions

  has_many :categories, through: :item_categories
  has_many :transactions, through: :item_transactions

  enum :item_type, ["income", "expense"]
end
