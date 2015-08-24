class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :payment_state, index: true
      t.belongs_to :registration, index: true
      t.belongs_to :user, index: true

      t.integer :point
      t.integer :amount

      t.timestamps null: false
    end

    change_column :payments, :user_id,
                  :integer, :null => false
  end
end
