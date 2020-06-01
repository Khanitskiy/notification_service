class NotificationCreator

  #NotificationCreator.new.confirm.to_user(user).send_email

  def initialize()
    @text = ''
    @notification = ''
    @user = nil
  end

  def to_user(user)
    @user = user
    @text = UseShorcodes.new(user,  @text).call
    self
  end

  def send_email()
    result = NotificationMailer.send_email(@user, @text, @notification_type).deliver
    puts result
  end

  def send_sms()
    #TwilioMessenger.new(@user, @text).call
    result = TurboSmsMessenger.new(@user, @text).call
    puts result
  end

  def method_missing(method, *args)
    notification = Notification.find_by(notification_type: method.to_s)
    if notification.present?
      @notification_type = notification.notification_type
      @text = notification.text
      self
    else
      super
    end
  end
end