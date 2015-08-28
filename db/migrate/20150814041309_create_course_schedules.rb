class CreateCourseSchedules < ActiveRecord::Migration
  def change
    create_table :course_schedules do |t|
      t.belongs_to :course, index: true

      t.integer :order, null: false

      t.timestamps null: false
    end
  end
end
