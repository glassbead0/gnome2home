class Admins::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def create
    if params[:pin].to_s == ENV['GNOME2HOME_PIN']
      super
    else
      redirect_to root_path, alert: 'Sorry, wrong pin. you can\'t create an account'
    end
  end

end
