# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Countries do
  before do
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:api_football_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:api_football_com]  = 'https://v3.football.api-sports.io'
    end

    stubs_countries_api_dash
  end

  after do
    #Sports::Butler::Configuration.reset
    #Sports::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when all' do
    it 'returns all countries' do
      api = Sports::Butler::Api.new(:soccer, :api_football_com)
      endpoint = described_class.new(sport: :soccer, api_name: :api_football_com, api: api).all

      expect(endpoint).to be_a(Sports::Butler::Api)
      expect(endpoint.response).to be_a(HTTParty::Response)
      expect(endpoint.response.parsed_response).to be_a(Hash)
      expect(endpoint.response.parsed_response['response']).to match_array(response_areas_api_dash)
    end
  end
end

def stubs_countries_api_dash

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries/2002")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?name=Absurdistan")
    .to_return(status: 200, body: get_mocked_response('leagues_missing_name.json', :api_football))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?name=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?search=Alb")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))


  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?code=AL")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', :api_football))
end

def response_area_api_dash
  [
    {
      "name": "Albania",
      "code": "AL",
      "flag": "https://media.api-sports.io/flags/al.svg"
    }.with_indifferent_access
  ]
end

def response_areas_all_api_dash
  {
    "get": "countries",
    "parameters": [],
    "errors": [],
    "results": 161,
    "paging": {
      "current": 1,
      "total": 1
    }.with_indifferent_access,
    "response": [
             {
               "id": 2000,
               "name": "Afghanistan",
               "countryCode": "AFG",
               "ensignUrl": "null",
               "parentAreaId": 2014,
               "parentArea": "Asia"
             }.with_indifferent_access,
             {
               "id": 2001,
               "name": "Africa",
               "countryCode": "AFR",
               "ensignUrl": "null",
               "parentAreaId": 2267,
               "parentArea": "World"
             }.with_indifferent_access,
             {
               "id": 2002,
               "name": "Albania",
               "countryCode": "ALB",
               "ensignUrl": "null",
               "parentAreaId": 2077,
               "parentArea": "Europe"
             }.with_indifferent_access
           ]
  }.with_indifferent_access
end

def response_areas_api_dash
  [
    {
      "id": 2000,
      "name": "Afghanistan",
      "countryCode": "AFG",
      "ensignUrl": "null",
      "parentAreaId": 2014,
      "parentArea": "Asia"
    }.with_indifferent_access,
    {
      "id": 2001,
      "name": "Africa",
      "countryCode": "AFR",
      "ensignUrl": "null",
      "parentAreaId": 2267,
      "parentArea": "World"
    }.with_indifferent_access,
    {
      "id": 2002,
      "name": "Albania",
      "countryCode": "ALB",
      "ensignUrl": "null",
      "parentAreaId": 2077,
      "parentArea": "Europe"
    }.with_indifferent_access
  ]
end
