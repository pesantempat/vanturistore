class AddRewardTransactionToLoyaltyPointTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :loyalty_point_transactions, :reward_transaction, :string
  end
end
