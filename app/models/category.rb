class Category < ApplicationRecord
  has_many :items
  belongs_to :budget, dependent: :destroy
end
