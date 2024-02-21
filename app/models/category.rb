class Category < ApplicationRecord
  belongs_to :budget
  has_many   :items
end
