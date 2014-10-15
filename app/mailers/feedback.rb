class Feedback < ActionMailer::Base
  default from: "from@example.com"

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

    mail from: @email
    mail to: "glassbead@gmail.com"
  end
end
