class Api::V1::HealthUnitsController < ApplicationController
  before_action :get_params

  def index
    @ubs = CsvService.new(params[:query]).process
    if @ubs.nil?
      render json: { status: 'UBS not found' }
    end
    HealthUnit.page(params[:page]).per(params[:per_page])
  end

  private

  def get_params
    @pagination_page = params[:page]
    @pagination_per_page = params[:per_page]
  end
end