class CreateLessonSchedules < ActiveRecord::Migration
  def change
    create_table :lesson_schedules do |t|
      t.belongs_to :course_schedule, index: true
      t.belongs_to :location, index: true
      t.belongs_to :lesson, index: true

      t.timestamp :held_at, null: false

      t.timestamps null: false
    end
  end
end
