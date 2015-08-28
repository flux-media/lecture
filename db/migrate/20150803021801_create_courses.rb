class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :program, index: true

      t.string :name, null: false
      t.text :summary
      t.text :detail

      t.timestamps null: false
    end

    change_column :courses, :program_id, :integer, :null => false
    add_attachment :courses, :thumbnail
  end
end
