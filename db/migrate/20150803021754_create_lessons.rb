class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :course, index: true
      t.belongs_to :teacher, index: true

      t.string :name, null: false
      t.integer :order, null: false

      t.timestamps null: false
    end

    change_column :lessons, :course_id, :integer, :null => false
    change_column :lessons, :teacher_id, :integer, :null => false
  end
end
