class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :size
      t.integer :adaptation_for_seniors
      t.integer :medical_equipament
      t.integer :medicine
      t.references :health_unit

      t.timestamps
    end
  end
end
