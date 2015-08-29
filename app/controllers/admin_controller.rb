class AdminController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def index
    render 'admin/index'
  end

  def update
    admin_config = AdminConfig.first

    admin_config.copyright = params[:admin_config][:copyright]
    admin_config.introduction = params[:admin_config][:introduction]
    admin_config.meta_title = params[:admin_config][:meta_title]
    admin_config.meta_description = params[:admin_config][:meta_description]
    admin_config.meta_fb_admins = params[:admin_config][:meta_fb_admins]
    admin_config.meta_fb_app_id = params[:admin_config][:meta_fb_app_id]
    admin_config.meta_twitter_site = params[:admin_config][:meta_twitter_site]
    admin_config.meta_og_article_publisher =
        params[:admin_config][:meta_og_article_publisher]
    admin_config.meta_publisher = params[:admin_config][:meta_publisher]

    if !params[:delete_thumbnail].nil? && params[:delete_thumbnail].to_i === 1
      admin_config.meta_thumbnail = params[:admin_config][:meta_thumbnail]
    end

    if admin_config.save
      redirect_to admin_path
    end
  end
end
