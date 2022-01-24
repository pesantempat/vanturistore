class ChangeStatusTransaksiToBeStringInLoyaltyPointTransactions < ActiveRecord::Migration[5.2]
  def change
    change_column :loyalty_point_transactions, :status_transaksi, :string
  end
end
