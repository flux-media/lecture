class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :price, null: false
      t.integer :discount_price, null: false
      t.integer :point, null: false
      
      t.timestamps null: false
    end
  end
end
