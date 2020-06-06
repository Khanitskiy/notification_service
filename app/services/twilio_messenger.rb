class TwilioMessenger

  def initialize(user, message)
    @message = message
    @user = user
  end

  def call
    client = Twilio::REST::Client.new

    client.messages.create({
      from: Rails.application.secrets.twilio_phone_number,
      to: @user.phone,
      body: @message,
    })
  end
end