class CreateLoyaltyPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_points do |t|
      t.integer :point_customer
      t.references :customer, foreign_key: true
      t.references :t_mitra, foreign_key: true

      t.timestamps
    end
  end
end
