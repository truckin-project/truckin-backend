module Api
  module V1
    class StopPointsController < ApplicationController
      def index
        @stop_points = StopPoint.includes(:address, :ratings).all

        render json: { status: 'SUCCESS', data: @stop_points }, status: :ok
      end
    end
  end
end