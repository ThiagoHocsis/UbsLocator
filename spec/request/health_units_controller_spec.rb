require 'rails_helper'
RSpec.describe 'HealthUnitsController', type: :request do

  let(:valid_ubs) {create(:health_unit)}
  UBS_ENDPOINT = '/api/v1/find_ubs?query=-21.2585234642023,-45.003476142882&page=1&per_page=1'

  describe 'GET api/v1/find_ubs' do
    it 'will retrieve response code 200' do
      get UBS_ENDPOINT, params: {format: :json}
      expect(response).to have_http_status(200)
    end
  end

  it 'will return all ubs with the given geolocation' do
    get UBS_ENDPOINT, params: {format: :json}
    response_ubs = response_body
    expect(response_ubs['entries'].count).to eq(1)
  end

  describe 'GET api/v1/find_ubs' do
    it 'will retrieve correct ubs ' do
      get UBS_ENDPOINT, params: {format: :json}
      response_ubs = response_body
      expect(response_ubs['entries'].first['name']).to eq valid_ubs[:name]
      expect(response_ubs['entries'].first['address']).to eq valid_ubs[:address]
      expect(response_ubs['entries'].first['city']).to eq valid_ubs[:city]
      expect(response_ubs['entries'].first['phone']).to eq valid_ubs[:phone]
    end
  end

  describe 'GET api/v1/find_ubs' do
    it 'will return that ubs was not found ' do
      get '/api/v1/find_ubs?query=-21.2585234121212,-45.003476142882&page=1&per_page=1', params: {format: :json}
      response_ubs = response_body
      expect(response_ubs['error']).to eq ('UBS not found')
      expect(response).to have_http_status(404)
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end
end