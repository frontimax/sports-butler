# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Countries do
  before do
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:apifootball_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:apifootball_com]  = 'https://apiv2.apifootball.com'
    end

    stubs_countries_apifootball
  end

  after do
    #Sports::Butler::Configuration.reset
    #Sports::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when all' do
    it 'returns all countries' do
      api = Sports::Butler::Api.new(:soccer, :apifootball_com)
      endpoint = described_class.new(sport: :soccer, api_name: :apifootball_com, api: api).all

      expect(endpoint).to be_a(Sports::Butler::Api)
      expect(endpoint.response).to be_a(HTTParty::Response)
      expect(endpoint.response.parsed_response).to be_a(Array)
      expect(endpoint.response.parsed_response).to match_array(response_areas_apifootball)
    end
  end
end

def stubs_countries_apifootball
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:apifootball_com]}/?APIkey=my_dummy_token&action=get_countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', :apifootball))
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

def response_areas_apifootball
  [
    {
      "country_id": "41",
      "country_name": "England",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png"
    }.with_indifferent_access,
    {
      "country_id": "46",
      "country_name": "France",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/46_france.png"
    }.with_indifferent_access
  ]
end
