class CreateTTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :t_tasks do |t|
      t.string :nama_task
      t.string :description
      t.integer :rupiah
      t.decimal :presentase
      t.string :waktu
      t.string :frekuensi
      t.string :tingkat_kesulitan
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
