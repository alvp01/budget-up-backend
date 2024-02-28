class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.datetime    :date
      t.string      :note
      t.belongs_to  :item
      t.belongs_to  :budget
      t.float       :amount, null: false, default: 0.0

      t.timestamps
    end
  end
end
