class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, null: false

      t.string :blog_url
      t.string :facebook_url
      t.string :twitter_id
      t.text :description

      t.timestamps null: false
    end

    add_attachment :teachers, :thumbnail
  end
end
