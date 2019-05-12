class CreateHealthUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :health_units do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
