class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :name, null: false
    	t.string :detail, null: true
    	t.string :thumbnail, null: true

      t.timestamps null: false
    end
  end
end
