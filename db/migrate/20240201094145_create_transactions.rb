class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string   :note
      t.float    :amount,  null: false, default: 0.0
      t.integer  :item_id, null: false

      t.timestamps
    end

    add_index :transactions, :item_id
  end
end
