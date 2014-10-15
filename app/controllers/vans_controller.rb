class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy, :claim]
  before_action :authenticate_admin!, only: [:show, :edit, :new, :create, :claim, :update, :destroy]
  # GET /vans
  # GET /vans.json
  def index
    @vans_south = Van.where(direction: 'S').order(:departure_time)
    @vans_north = Van.where(direction: 'N').order(:departure_time)
  end

  # GET /vans/1
  # GET /vans/1.json
  def show
  end

  # GET /vans/new
  def new
    @van = Van.new
  end

  # GET /vans/1/edit
  def edit
  end

  # POST /vans
  # POST /vans.json
  def create
    @van = Van.new(van_params)
    create_stops_for(@van)
    @van.departure_time_readable = @van.stops[0].location + ' on ' + @van.departure_time.strftime('%a: %b %e, %l:%M %P')
    respond_to do |format|
      if @van.save
        format.html { redirect_to @van, notice: 'Van was successfully created.' }
        format.json { render :show, status: :created, location: @van }
      else
        format.html { render :new }
        format.json { render json: @van.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_stops_for(van)
    van.stops.delete_all
    if van.direction == 'S'
      stop1 = Stop.create(location: 'CSU', time: van.departure_time, human_readable: 'CSU at ' + van.departure_time.strftime('%a: %b %e, %l:%M %P'))
      stop2 = Stop.create(location: 'Harmony Rd', time: stop1.time + 10.minutes, human_readable: 'Harmony Rd at ' + (stop1.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
      stop3 = Stop.create(location: 'Thornton', time: stop2.time + 35.minutes, human_readable: 'Thornton at ' + (stop2.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
      stop4 = Stop.create(location: 'Union Station', time: stop3.time + 15.minutes, human_readable: 'Union Station at ' + (stop3.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
      van.stops << stop1 << stop2 << stop3 << stop4
    elsif van.direction == 'N'
      stop5 = Stop.create(location: 'Union Station', time: van.departure_time, human_readable: 'Union Station at ' + van.departure_time.strftime('%a: %b %e, %l:%M %P'))
      stop6 = Stop.create(location: 'Thornton', time: stop5.time + 15.minutes, human_readable: 'Thornton at ' + (stop5.time + 15.minutes).strftime('%a: %b %e, %l:%M %P'))
      stop7 = Stop.create(location: 'Harmony Rd', time: stop6.time + 35.minutes, human_readable: 'Harmony Rd at ' + (stop6.time + 35.minutes).strftime('%a: %b %e, %l:%M %P'))
      stop8 = Stop.create(location: 'CSU', time: stop7.time + 10.minutes, human_readable: 'CSU at ' + (stop7.time + 10.minutes).strftime('%a: %b %e, %l:%M %P'))
      van.stops << stop5 << stop6 << stop7 << stop8
    end
  end

  def claim
    authenticate_admin!
    @van.admin = current_admin
    @van.driver = current_admin.first_name
    @van.save
    current_admin.vans << @van
    redirect_to "/scan/start_trip?van=#{@van.id}", notice: "#{current_admin.email} is now the driver of Van #{@van.id}"
  end

  # PATCH/PUT /vans/1
  # PATCH/PUT /vans/1.json
  def update
    respond_to do |format|
      if @van.update(van_params)
        create_stops_for(@van)
        @van.save
        format.html { redirect_to vans_path, notice: 'Van was successfully updated.' }
        format.json { render :show, status: :ok, location: @van }
      else
        format.html { render :edit }
        format.json { render json: @van.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vans/1
  # DELETE /vans/1.json
  def destroy
    @van.destroy
    respond_to do |format|
      format.html { redirect_to vans_url, notice: 'Van was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_van
      @van = Van.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def van_params
      params.require(:van).permit(:driver, :direction, :seats_available, :seats_occupied, :departure_time)
    end
end
