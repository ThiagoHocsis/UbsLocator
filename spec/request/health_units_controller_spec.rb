require 'rails_helper'
RSpec.describe 'HealthUnitsController', type: :request do

  let(:valid_ubs) do
    {
        "current_page": "1",
        "per_page": "1",
        "total_entries": 1,
        "entries": [
            {
                "id": 1,
                "name": "CRUZEIRO DO SUL",
                "address": "R OUVIDOR BUSTAMANT",
                "city": "Lavras",
                "phone": "353694413",
                "geocode": {
                    "lat": -21.2585234642023,
                    "long": -45.003476142882
                },
                "scores": {
                    "size": 1,
                    "adaptation_for_senior": 1,
                    "medical_equipament": 1,
                    "medicine": 2
                }
            }
        ]
    }
  end

  describe 'GET api/v1/find_ubs' do
    it 'will retrieve response code 200' do
      get '/api/v1/find_ubs?query=-21.2585234642023,-45.003476142882&page=1&per_page=1', params: {format: :json}
      expect(response).to have_http_status(200)
    end
  end

  it 'will return all ubs with the given geolocation' do
    get '/api/v1/find_ubs?query=-21.2585234642023,-45.003476142882&page=1&per_page=1', params: {format: :json}
    response_ubs = response_body
    expect(response_ubs['entries'].count).to eq(1)
  end

  describe 'GET api/v1/find_ubs' do
    it 'will retrieve correct ubs ' do
      get '/api/v1/find_ubs?query=-21.2585234642023,-45.003476142882&page=1&per_page=1', params: {format: :json}
      response_ubs = response_body
      expect(response_ubs['entries'].first['name']).to eq valid_ubs[:entries].first[:name]
      expect(response_ubs['entries'].first['address']).to eq valid_ubs[:entries].first[:address]
      expect(response_ubs['entries'].first['city']).to eq valid_ubs[:entries].first[:city]
      expect(response_ubs['entries'].first['phone']).to eq valid_ubs[:entries].first[:phone]
    end
  end

  describe 'GET api/v1/find_ubs' do
    it 'will return that ubs was not found ' do
      get '/api/v1/find_ubs?query=-21.2585234121212,-45.003476142882&page=1&per_page=1', params: {format: :json}
      response_ubs = response_body
      expect(response_ubs['status']).to eq ('UBS not found')
    end
  end

  private

  def response_body
    JSON.parse(response.body)
  end
end