class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string  :category_type, null: false
      t.integer :budget_id

      t.timestamps
    end

    add_index :categories, :budget_id
  end
end
