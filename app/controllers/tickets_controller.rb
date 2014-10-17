class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_passenger!, only: [:new, :create, :show]
  before_action :authenticate_admin!, only: [:edit, :index, :update]
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new

    @van = Van.find(params[:van_id])

    if @van.seats_available < 1
      redirect_to vans_path, alert: 'Sorry, that van is full.'
    end
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    n = params[:number_of_tickets].to_i

    # make sure there are enough tickets

    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        @ticket.qrcode = "http://gnome2home.herokuapp.com/scan/ticket?ticket_id=#{@ticket.id}"
        @ticket.van.seats_available -= 1
        @ticket.van.save
        @ticket.save
        Recipt.send_recipt(@ticket).deliver
        (n-1).times do
          ticket = Ticket.new(ticket_params)
          ticket.save
          ticket.qrcode = "http://gnome2home.herokuapp.com/scan/ticket?ticket_id=#{ticket.id}"
          ticket.van.seats_available -= 1
          ticket.van.save
          ticket.save
          Recipt.send_recipt(ticket).deliver
        end

        if n == 1
          format.html { redirect_to @ticket, notice: 'Thank you for riding Gnome2Home. You will receive an email shortly with your QR code and confirmation number' }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { redirect_to edit_passenger_registration_path, notice: "Thanks for buying #{n} tickets. You can view all of you purchased tickets below. You will receive #{n} separate emails, each with a unique QR code ticket. Please keep those emails to check in. "}
          format.json { render :show, status: :created, location: @ticket }
        end

      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    van = @ticket.van
    van.seats_available += 1
    van.save
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to edit_passenger_registration_path, alert: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:scanned, :first_name, :last_name, :email, :qrcode, :van_id, :passenger_id)
    end
end
