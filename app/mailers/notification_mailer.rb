class NotificationMailer < ActionMailer::Base
  default from: 'vaserman543345@gmail.com'

  def send_email(user, text, notification_type)
    @text = text
    mail(to: user.email, subject: "#{notification_type.capitalize} Email")
    "Email was send \nemail: #{user.email} \ntext: #{@message}"
  end
end
