module Api
  module V1
    class HealthUnitsController < ApplicationController
      before_action :filter_params

      def index
        @ubs = CsvService.new(params[:query]).process
        HealthUnit.page(params[:page]).per(params[:per_page])
        render json: { error: 'UBS not found' }, status: :not_found if @ubs.nil?
      end

      private

      def filter_params
        @pagination_page = params[:page]
        @pagination_per_page = params[:per_page]
      end
    end
  end
end