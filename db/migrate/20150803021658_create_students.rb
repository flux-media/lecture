class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.timestamps null: false
    end

    add_reference :students, :user, index: true, foreign_key: true
  	change_column :students, :user_id, :integer, :null => false
  end
end
