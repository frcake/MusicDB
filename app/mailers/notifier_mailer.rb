class NotifierMailer < ApplicationMailer
  # default from: 'from@example.com'
  # layout 'mailer'

  default from: 'brokernotify@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to broker')
  end
end
