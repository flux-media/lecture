class CreateLessonSchedules < ActiveRecord::Migration
  def change
    create_table :lesson_schedules do |t|
      t.timestamp :held_at, null: false

      t.timestamps null: false
    end

    add_reference :lesson_schedules, :lesson, index: true, foreign_key: true
    change_column :lesson_schedules, :lesson_id, :integer, :null => false
  end
end
