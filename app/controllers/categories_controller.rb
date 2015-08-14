class CategoriesController < ApplicationController
  before_action :check_admin

  def create
    category = Category.new
    category.name = params[:category][:name]

    if category.save
      redirect_to admin_category_path
    end
  end

  def delete
    category = Category.find(params[:id])
    if category != nil
      category.destroy
    end

    redirect_to admin_category_path
  end

  def edit
    @category = Category.find(params[:id])
    render template: 'categories/new',
           :layout => 'admin',
           :locals => {:action => 'update'}
  end

  def index
    @categories = Category.all
    render template: 'categories/index',
           :layout => 'admin'
  end

  def new
    @category = Category.new
    render :layout => 'admin',
           :locals => {:action => 'create'}
  end

  def update
    category = Category.find(params[:category][:id])
    category.name = params[:category][:name]

    if category.save
      redirect_to admin_edit_category_path category.id
    end
  end
end
