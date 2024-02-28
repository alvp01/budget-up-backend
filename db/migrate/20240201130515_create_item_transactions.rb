class CreateItemTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :item_transactions do |t|
      t.belongs_to :item
      t.belongs_to :transaction

      t.timestamps
    end
  end
end
