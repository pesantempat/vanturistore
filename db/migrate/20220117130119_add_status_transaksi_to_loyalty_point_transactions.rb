class AddStatusTransaksiToLoyaltyPointTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :loyalty_point_transactions, :status_transaksi, :integer
  end
end
