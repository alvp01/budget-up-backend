class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.float :planned_amount,   null: false, default: 0.0
      t.float :remaining_amount, null: false, default: 0.0
      t.date  :budget_date,      null: false

      t.timestamps
    end
  end
end
