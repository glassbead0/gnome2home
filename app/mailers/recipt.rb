class Recipt < ActionMailer::Base
  include SendGrid

  default from: "no-reply@gnome2home.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.recipt.send_recipt.subject
  #
  def send_recipt(ticket)
    @ticket = ticket

    mail to: ticket.email
  end
end
