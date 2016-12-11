class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true

      t.integer :state, default: 1
      t.integer :amount, null: false
      t.integer :number_of_students, default: 1
      t.text :description

      t.timestamps null: false
    end
  end
end
