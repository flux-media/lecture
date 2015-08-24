class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
    	t.string :description

      t.timestamps null: false
    end

    add_reference :teachers, :user, index: true, foreign_key: true
  	change_column :teachers, :user_id, :integer, :null => false
  end
end
