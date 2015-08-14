class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :program, index: true

    	t.string :name, null: false
    	t.string :detail, null: true
    	t.string :thumbnail, null: true

      t.timestamps null: false
    end

    change_column :courses, :program_id, :integer, :null => false
  end
end
