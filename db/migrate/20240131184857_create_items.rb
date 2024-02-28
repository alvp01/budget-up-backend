class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.float      :planned_amount,    null: false, default: 0.0
      t.float      :remaining_amount,  null: false, default: 0.0
      t.integer    :item_type,         null: false, default: 1
      t.string     :label
      t.belongs_to :category
      t.belongs_to :budget

      t.timestamps
    end
  end
end
