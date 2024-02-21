class Item < ApplicationRecord
  belongs_to :budget,   dependent: :destroy
  belongs_to :category

  has_many :item_transactions

  has_many :transactions, through: :item_transactions

  enum :item_type, ["income", "expense"]
end
