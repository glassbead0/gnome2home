class PasswordReset < Devise::Mailer
  include SendGrid
  default from: "no-reply@gnome2home.com"
end
