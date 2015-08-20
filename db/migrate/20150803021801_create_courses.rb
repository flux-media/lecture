class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :program, index: true

      t.string :name, null: false
      t.string :summary
      t.string :detail
      t.string :thumbnail

      t.timestamps null: false
    end

    change_column :courses, :program_id, :integer, :null => false
  end
end
