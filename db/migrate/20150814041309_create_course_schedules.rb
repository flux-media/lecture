class CreateCourseSchedules < ActiveRecord::Migration
  def change
    create_table :course_schedules do |t|
      t.integer :order, null: false
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
  end
end
