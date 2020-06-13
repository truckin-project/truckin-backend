module Api
  module V1
    class AuthenticationController < ApplicationController
     skip_before_action :authenticate_request

     def start
       command = ValidatePhoneNumber.call(params[:phone_number])

       if command.success?
         render json: { status: 'SUCCESS' }, status: :ok
       else
         render json: { status: 'ERROR', error: command.errors }, status: :unprocessable_entity
       end
     end

     def authenticate
       command = AuthenticateUser.call(params[:phone_number], params[:code])

       if command.success?
         render json: { status: 'SUCCESS', auth_token: command.result }, status: :ok
       else
         render json: { status: 'ERROR', error: command.errors }, status: :unauthorized
       end
     end
    end
  end
end