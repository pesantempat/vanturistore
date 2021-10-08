class LoyaltyProgram < ApplicationRecord
  belongs_to :reward
  belongs_to :t_mitra

  def date_expired
	(end_loyalty.to_date - Date.today.to_date).to_i
  end

end
