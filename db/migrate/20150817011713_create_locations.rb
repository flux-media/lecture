class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.float :latitude, null: true
      t.float :longitude, null: true
      t.string :phone_number, null: true
      t.string :address, null: true
      t.string :website, null: true

      t.timestamps null: false
    end
  end
end
