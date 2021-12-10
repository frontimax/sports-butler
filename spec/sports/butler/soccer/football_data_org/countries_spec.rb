# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Countries do
  before do
    ConfigHelpers.set_football_data_org
    stubs_countries_football_data_org
  end

  describe 'when #all' do
    it_behaves_like 'when #all', :soccer, :football_data_org, :countries, Hash,
                    :response_areas_football_data_org, :areas

    it 'returns all countries' do
      api = Sports::Butler::Api.new(:soccer, :football_data_org)
      endpoint = described_class.new(sport: :soccer, api_name: :football_data_org, api: api).all

      expect(endpoint).to be_a(Sports::Butler::Api)
      expect(endpoint.response).to be_a(HTTParty::Response)
      expect(endpoint.response.parsed_response).to be_a(Hash)
      expect(endpoint.response.parsed_response).to include(response_areas_football_data_org.stringify_keys)
    end
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', :soccer, :football_data_org, :countries, 'Albania', Hash,
                    :response_area_football_data_org, :stringify_keys

    it 'returns England' do
      api = Sports::Butler::Api.new(:soccer, :football_data_org)
      endpoint = described_class.new(sport: :soccer, api_name: :football_data_org, api: api).by_name(name: 'Albania')

      expect(endpoint).to be_a(Sports::Butler::Api)
      expect(endpoint.response).to be_a(HTTParty::Response)
      expect(endpoint.response.parsed_response).to be_a(Hash)
      expect(endpoint.response.parsed_response).to include(response_area_football_data_org.stringify_keys)
    end
  end
end

def stubs_countries_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:football_data_org]}/areas/2002")
    .to_return(status: 200, body: get_mocked_response('area.json', :soccer, :football_data_org))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:football_data_org]}/areas")
    .to_return(status: 200, body: get_mocked_response('areas.json', :soccer,:football_data_org))
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

def response_areas_football_data_org
  {
    "count": 3,
    "filters": {},
    "areas": [
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
  }
end

def response_area_football_data_org
  {
    "id": 2002,
    "name": "Albania",
    "countryCode": "ALB",
    "ensignUrl": 'null',
    "parentAreaId": 2077,
    "parentArea": "Europe"
  }
end
