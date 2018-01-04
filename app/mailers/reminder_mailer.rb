class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def reminder
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end


  def user_invitation(email, invitation_token)
    @token = invitation_token

    mail from: 'info@facebook.com', to: email, subject: 'Welcome to AlMakinah'
  end
