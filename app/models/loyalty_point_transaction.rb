class LoyaltyPointTransaction < ApplicationRecord
  belongs_to :loyalty_point

  #enum status_transaksi: [:Belum, :Sudah]
end
