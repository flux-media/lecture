class CreateCourseProgramJoinTable < ActiveRecord::Migration
  def change
    create_table :courses_programs, :id => false do |t|
      t.integer :program_id
      t.integer :course_id
    end

    add_index :courses_programs, [:course_id, :program_id]
  end
end
