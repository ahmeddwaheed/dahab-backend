class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def payment_notification(user)
    @greeting = "Hiiiiiiiiiii"
    @user = user
    puts @greeting

    mail(to: @user.email, subject: "Payment Notification" )
  end

  def repayment_notification(user)
    greeting = "Hi"
    @user = user
    puts greeting
    mail(to: @user.email, subject: "Repayment Notification" )
  end
end


  # def user_invitation(email, invitation_token)
  #   @token = invitation_token
  #
  #   mail from: 'info@facebook.com', to: email, subject: 'Welcome to AlMakinah'
  # end
