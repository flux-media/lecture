class CreatePaymentStates < ActiveRecord::Migration
  def change
    create_table :payment_states do |t|
      t.string :name, null: false
      t.string :key, null: false

      t.timestamps null: false
    end
  end
end
