class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.float   :planned_amount,    null: false, default: 0.0
      t.float   :allocated_amount,  null: false, default: 0.0
      t.integer :item_type,         null: false, default: 0
      t.string  :label
      t.integer :category_id
      t.integer :budget_id,         null: false

      t.timestamps
    end

    add_index :items, :category_id
    add_index :items, :budget_id
  end
end
