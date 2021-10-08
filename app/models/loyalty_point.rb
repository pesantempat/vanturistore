class LoyaltyPoint < ApplicationRecord
  belongs_to :customer
  belongs_to :t_mitra
  has_many :loyalty_point_transactions
end
