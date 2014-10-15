class PasswordReset < Devise::Mailer
  include SendGrid
  default from: "glassbead@gmail.com"
end
