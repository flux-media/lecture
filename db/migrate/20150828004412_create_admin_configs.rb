class CreateAdminConfigs < ActiveRecord::Migration
  def change
    create_table :admin_configs do |t|
      t.string :copyright
      t.string :introduction
      t.string :meta_title
      t.string :meta_description
      t.string :meta_fb_admins
      t.string :meta_fb_app_id
      t.string :meta_twitter_site
      t.string :meta_og_article_publisher
      t.string :meta_publisher

      t.timestamps null: false
    end

    add_attachment :admin_configs, :meta_thumbnail
  end
end
