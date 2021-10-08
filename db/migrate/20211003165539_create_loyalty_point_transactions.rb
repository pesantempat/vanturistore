class CreateLoyaltyPointTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_point_transactions do |t|
      t.integer :point_customer_transaction
      t.string :trans_type, :default => "get-point"
      t.references :loyalty_point, foreign_key: true

      t.timestamps
    end
  end
end
