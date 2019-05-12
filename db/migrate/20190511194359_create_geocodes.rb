class CreateGeocodes < ActiveRecord::Migration[5.0]
  def change
    create_table :geocodes do |t|
      t.float :lat
      t.float :long
      t.references :health_unit

      t.timestamps
    end
  end
end
