class Admin::CategoriesController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    category = Category.new
    category.name = params[:category][:name]

    if category.save
      redirect_to admin_categories_path
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category != nil
      category.destroy
    end

    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    render :locals => {:action => 'create'}
  end

  def show
    @category = Category.find(params[:id])
    render template: 'admin/categories/new',
           :layout => 'admin',
           :locals => {:action => 'update'}
  end

  def update
    category = Category.find(params[:category][:id])
    category.name = params[:category][:name]

    if category.save
      redirect_to admin_categories_path
    end
  end
end
