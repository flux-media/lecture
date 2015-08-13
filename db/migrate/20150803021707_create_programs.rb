class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
    	t.string :name, null: false
      t.boolean :is_public, default: false

      t.timestamps null: false
    end

    add_reference :programs, :category, index: true, foreign_key: true
    change_column :programs, :category_id, :integer, :null => false
  end
end
