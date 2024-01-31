class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.float :planned_amount,   null: false
      t.float :remaining_amount, null: false

      t.timestamps
    end
  end
end
