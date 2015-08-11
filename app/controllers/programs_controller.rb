class ProgramsController < ApplicationController
  before_action :check_admin

  def create
    program = Program.new
    program.name = params[:program][:name]
    if program.save
      redirect_to admin_program_path
    end
  end

  def delete
    program = Program.find(params[:id])
    if program != nil
      program.destroy
    end

    redirect_to admin_program_path
  end

  def edit
    @program = Program.find(params[:id])
    render template: 'programs/new',
           :layout => 'admin',
           :locals => {:action => 'Update'}
  end

  def index
    @programs = Program.all
    render template: 'programs/index', :layout => 'admin'
  end

  def new
    @program = Program.new
    render :layout => 'admin',
           :locals => {:action => 'Create'}
  end

  def update
    program = Program.find(params[:program][:id])
    program.name = params[:program][:name]
    if program.save
      redirect_to admin_edit_program_path program.id
    end
  end
end
