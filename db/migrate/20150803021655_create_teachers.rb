class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :user, index: true

      t.string :facebook_id
      t.string :google_plus_id
      t.string :twitter_id
      t.text :description

      t.timestamps null: false
    end

    change_column :teachers, :user_id,
                  :integer, :null => false
  end
end
