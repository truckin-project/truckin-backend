class ValidatePhoneNumber
  prepend SimpleCommand

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def call
    Verify.valid_phone_number?(phone_number) if user
  end

  private

  attr_accessor :phone_number

  def user
    user = User.find_by_phone_number(phone_number)
    return user if user

    errors.add :user, 'Invalid user'
    nil
  end
end