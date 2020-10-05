class CreateTMitras < ActiveRecord::Migration[5.2]
  def change
    create_table :t_mitras do |t|
      t.string :nama_mitra
      t.string :alamat
      t.string :telp
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
