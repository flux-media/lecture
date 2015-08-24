class Admin::LocationsController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def create
    location = Location.new
    location.name = params[:location][:name]
    location.latitude = params[:location][:latitude]
    location.longitude = params[:location][:longitude]
    location.phone_number = params[:location][:phone_number]
    location.address = params[:location][:address]
    location.website = params[:location][:website]

    if location.save
      redirect_to admin_locations_path
    end
  end

  def destroy
    location = Location.find(params[:id])

    if !location.nil? && location.destroy
      redirect_to admin_locations_path
    end
  end

  def edit
    @location = Location.find(params[:id])
    render template: 'admin/locations/new',
           :locals => {action: 'update'}
  end

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    render :locals => {action: 'create'}
  end

  def update
    location = Location.find(params[:id])
    location.name = params[:location][:name]
    location.latitude = params[:location][:latitude]
    location.longitude = params[:location][:longitude]
    location.phone_number = params[:location][:phone_number]
    location.address = params[:location][:address]
    location.website = params[:location][:website]

    if location.save
      redirect_to admin_locations_path
    end
  end
end
