class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.timestamps null: false
    end

    add_reference :registrations, :course, index: true, foreign_key: true
    change_column :registrations, :course_id, :integer, :null => false
    add_reference :registrations, :student, index: true, foreign_key: true
    change_column :registrations, :student_id, :integer, :null => false
  end
end
