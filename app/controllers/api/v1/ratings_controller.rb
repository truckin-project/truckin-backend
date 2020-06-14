module Api
  module V1
    class RatingsController < ApplicationController

      def create
        @rating = Rating.new(rating_params)
        if @rating.save
          render json: { status: 'SUCCESS', data: @rating }, status: :ok
        else
          render json: { status: 'ERROR', errors: @rating.errors }, status: :unprocessable_entity
        end
      end

      private
      def rating_params
        params.permit(:stop_point_id, :bath, :gas_price, :security, :food, :parking)
      end
    end
  end
end