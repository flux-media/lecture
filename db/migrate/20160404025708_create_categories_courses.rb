class CreateCategoriesCourses < ActiveRecord::Migration
  def change
    create_table :categories_courses do |t|
      t.belongs_to :category, index: true
      t.belongs_to :course, index: true
      t.timestamps null: false
    end

    add_index :categories_courses, [:category_id, :course_id], :unique => true
  end
end
