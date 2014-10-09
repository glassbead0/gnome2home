class ScanController < ApplicationController
  before_action :authenticate_admin!

  def ticket

    if params[:van]
      # set all my vans to not active (only 1 van/admin can be active at a time)
      @my_vans = current_admin.vans
      @my_vans.each do |v|
        v.active = false
        v.save
      end

      # set the selected van to active
      @van = Van.find_by(departure_time_readable: params[:van])
      @van.active = true
      @van.save
    elsif Van.find_by(active: true, admin_id: current_admin.id)
        @van = Van.where(active: true, admin_id: current_admin.id).first
    end

    unless @van
      redirect_to scan_start_trip_path, notice: 'select a van to start driving'
    end


  end

  def start_trip
    @my_vans = current_admin.vans

    @my_van_times = []
    @my_vans.each do |v|
      @my_van_times << v.departure_time_readable
    end


    @just_added_van = Van.find(params[:van]).departure_time_readable if params[:van]

  end
end
