class CreateLoyaltyPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_programs do |t|
      t.integer :point_loyalty
      t.datetime :start_loyalty
      t.datetime :end_loyalty
      t.string :status_loyalty
      t.text :keterangan_loyalty
      t.references :reward, foreign_key: true

      t.timestamps
    end
  end
end
