class CreateCourseSchedules < ActiveRecord::Migration
  def change
    create_table :course_schedules do |t|
      t.integer :order, null: false

      t.timestamps null: false
    end

    add_reference :course_schedules, :course, index: true, foreign_key: true
    change_column :course_schedules, :course_id, :integer, :null => false
  end
end
