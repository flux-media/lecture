class Admin::ProgramsController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    program = Program.new
    program.name = params[:program][:name]
    program.category = Category.find(params[:category])
    if program.save
      redirect_to admin_programs_path
    end
  end

  def destroy
    program = Program.find(params[:id])

    if program != nil && program.destroy
      redirect_to admin_programs_path
    end
  end

  def edit
    @program = Program.find(params[:id])
    render template: 'admin/programs/new',
           :locals => {:action => 'update',
                       :categories => Category.all}
  end

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
    render :locals => {:action => 'create',
                       :categories => Category.all}
  end

  def update
    program = Program.find(params[:program][:id])
    program.name = params[:program][:name]
    program.category = Category.find(params[:category])

    if program.save
      redirect_to admin_programs_path
    end
  end
end