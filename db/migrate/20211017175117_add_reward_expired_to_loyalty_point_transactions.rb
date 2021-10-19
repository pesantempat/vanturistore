class AddRewardExpiredToLoyaltyPointTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :loyalty_point_transactions, :reward_expired, :datetime
    #remove_reference :loyalty_point_transactions, :loyalty_program, foreign_key: true
  end
end
