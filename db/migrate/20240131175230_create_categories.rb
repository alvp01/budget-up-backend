class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string  :category_type, null: false
      t.belongs_to :budget

      t.timestamps
    end
  end
end
