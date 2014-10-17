class Passengers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/passenger.rb)
    @passenger = Passenger.from_omniauth(request.env["omniauth.auth"])

    if @passenger.persisted?
      sign_in_and_redirect @passenger, :event => :authentication #this will throw if @passenger is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      # flash[:alert] << "Your default password is #{@passenger.password}. Please remember this and go change it immediately"
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_passenger_registration_url
    end
  end
end
