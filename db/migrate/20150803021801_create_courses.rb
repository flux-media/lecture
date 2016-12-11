class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :teacher, index: true

      t.boolean :is_public, default: false
      t.boolean :is_on_sale, default: false
      t.boolean :is_full, default: false
      t.boolean :is_past, default: false

      t.string :slug, null: false, unique: true
      t.string :title, null: false
      t.string :date, null: false
      t.string :location
      t.integer :max_students, default: 80
      t.integer :students_enrolled, default: 0
      t.integer :duration, default: 2
      t.integer :original_price, default: 0
      t.integer :sale_price, default: 0

      t.text :summary
      t.text :detail

      t.timestamps null: false
    end

    add_attachment :courses, :thumbnail
  end
end
