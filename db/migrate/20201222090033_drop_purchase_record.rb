class DropPurchaseRecord < ActiveRecord::Migration[6.0]
  def change
    drop_table :purchase_records
  end
end
