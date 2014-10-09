class ScanController < ApplicationController
  before_action :authenticate_admin!

  def ticket

    # SETTING ACTIVE VAN PORTION
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

    # SCANNING TICKET PORTION
    if params[:ticket_id] && Ticket.find(params[:ticket_id])
      @ticket = Ticket.find(params[:ticket_id])
      #check to make sure ticket is valid
      if @ticket.scanned == false && @ticket.van == @van
        @ticket.scanned = true
        @ticket.save
        @van.seats_occupied += 1
        @van.save
        redirect_to scan_ticket_path, notice: "#{@ticket.first_name} #{@ticket.last_name} has been checked in"
      elsif @ticket.scanned
        redirect_to scan_ticket_path, alert: "INVALID TICKET! Ticket Has Already Been Scanned"
      elsif @ticket.van != @van
        redirect_to scan_ticket_path, alert: "INVALID TICKET! This ticket is for the van leaving at #{@ticket.van.departure_time_readable}"
      end
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
