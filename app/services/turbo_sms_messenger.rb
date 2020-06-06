class TurboSmsMessenger

  def initialize(user, message)
    @message = message
    @user = user
  end

  def call
    response = RestClient.post(
      'https://api.turbosms.ua/message/send.json',
      set_json,
      {:Authorization => "Bearer #{ENV['turbosms_bearer_code']}"})

    result_message(response)
  end

  private

  def result_message(response)
    body = JSON.parse response.body
    if body["response_status"] == "SUCCESS_MESSAGE_ACCEPTED"
      "SMS was send \nphone: #{@user.phone} \ntext: #{@message}"
    else
      "Something went wrong"
    end
  end

  def set_json
    {
      "recipients":[
        @user.phone
      ],
      "sms":{
        "sender": "IT Alarm",
        "text": @message
      }
    }
  end
end