class CreateResetPasswordTokens < ActiveRecord::Migration
  def change
    create_table :reset_password_tokens do |t|
      t.belongs_to :user, index: true

      t.string :key
      t.boolean :expired, default: false

      t.timestamps null: false
    end

    change_column :reset_password_tokens, :user_id, :integer, :null => false
  end
end
