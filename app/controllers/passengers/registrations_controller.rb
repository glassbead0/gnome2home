class Passengers::RegistrationsController < Devise::RegistrationsController

  def edit
    @tickets = current_passenger.tickets
    super
  end


end
