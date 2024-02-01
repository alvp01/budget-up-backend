class CreateItemTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :item_transactions do |t|
      t.integer :item_id
      t.integer :transaction_id

      t.timestamps
    end
    add_index :item_transactions, :item_id
    add_index :item_transactions, :transaction_id
  end
end
