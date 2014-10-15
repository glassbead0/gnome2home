class Feedback < ActionMailer::Base
  default from: "gnome2home_contact_form@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback.passenger_feedback.subject
  #
  def passenger_feedback(name, phone, email, message)
    @name = name
    @phone = phone
    @email = email
    @message = message

    mail to: "glassbead@gmail.com"
  end
end
