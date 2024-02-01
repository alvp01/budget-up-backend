class Budget < ApplicationRecord
  has_many :categories,   dependent: :destroy
  has_many :items,        dependent: :destroy
  has_many :transactions, dependent: :destroy
end
