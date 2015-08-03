class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
    	t.string :name, null: false
    	t.timestamp :held_at, null: true

      t.timestamps null: false
    end

    add_reference :lessons, :course, index: true, foreign_key: true
    change_column :lessons, :course_id, :integer, :null => false
  end
end
