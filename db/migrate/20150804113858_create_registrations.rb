class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :course_schedule, index: true
      t.belongs_to :student, index: true

      t.timestamps null: false
    end

    change_column :registrations, :course_schedule_id, :integer, :null => false
    change_column :registrations, :student_id, :integer, :null => false
  end
end
