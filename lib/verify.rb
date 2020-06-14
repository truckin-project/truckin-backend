class Verify
  class << self
    def valid_phone_number?(country_code='55', phone_number)
      response = Authy::PhoneVerification.start(country_code: country_code, phone_number: phone_number)
      response.success?
    end

    def valid_confirmation_code?(country_code='55', phone_number, code)
      response = Authy::PhoneVerification.check(verification_code: code, country_code: country_code, phone_number: phone_number)
      response.success?
    end
  end
end