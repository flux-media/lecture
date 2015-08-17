class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.belongs_to :category, index: true

      t.string :name, null: false
      t.boolean :is_public, default: false

      t.timestamps null: false
    end

    change_column :programs, :category_id,
                  :integer, :null => false
  end
end
