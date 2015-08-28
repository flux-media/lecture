class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    change_column :students, :user_id,
                  :integer, :null => false
  end
end
