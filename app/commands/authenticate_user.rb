class AuthenticateUser
  prepend SimpleCommand

  def initialize(phone_number, code)
    @phone_number = phone_number
    @code = code
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :phone_number, :code

  def user
    user = User.find_by_phone_number(phone_number)
    return user if user && Authy.valid_confirmation_code?(phone_number, code)

    errors.add :user_authentication, 'Invalid code'
    nil
  end
end