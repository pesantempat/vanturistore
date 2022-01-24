class LoyaltyProgram < ApplicationRecord
  belongs_to :reward
  belongs_to :t_mitra

  #enum status_loyalty: [:Actived, :Unactived]

  def date_expired
	(end_loyalty.to_date - Date.today.to_date).to_i
  end

end
