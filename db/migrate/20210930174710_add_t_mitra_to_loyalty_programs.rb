class AddTMitraToLoyaltyPrograms < ActiveRecord::Migration[5.2]
  def change
    add_reference :loyalty_programs, :t_mitra, foreign_key: true
  end
end
