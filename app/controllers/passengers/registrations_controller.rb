class Passengers::RegistrationsController < Devise::RegistrationsController

  def edit
    @tickets = current_passenger.tickets.order(:van_id)
    super
  end


end
