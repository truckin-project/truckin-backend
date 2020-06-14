module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request

      def create
        @user = User.new(user_params)
        if Verify.valid_phone_number?(@user.phone_number)
          @user.save
          render json: { status: 'SUCCESS', data: @user }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Please enter a valid phone number' }, status: :unprocessable_entity
        end
      end

      private
      def user_params
        params.permit(:name, :phone_number)
      end
    end
  end
end