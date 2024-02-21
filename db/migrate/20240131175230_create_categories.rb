class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string  :category_type, null: false
      t.boolean :is_default,    default: false

      t.timestamps
    end
  end
end
