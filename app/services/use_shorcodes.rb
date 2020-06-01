class UseShorcodes

  def initialize(user, text)
    @user = user
    @text = text
  end

  def call
    shortcode_substitution
  end

  private

  def shortcode_substitution
    shortcodes.each do |key, value|
      @text.gsub!("%#{key.to_s}%", value)
    end
    @text
  end

  def shortcodes
    {
      email: @user.email,
      phone: @user.phone,
      first_name: @user.first_name,
      last_name: @user.last_name,
    }
  end
end