class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name, null: false
      t.boolean :is_admin, default: false

      t.timestamp :deleted_at
      t.timestamps null: false
    end
  end
end
