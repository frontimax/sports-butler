# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Countries do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :countries }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_countries_football_data_org
  end

  describe 'when #all' do
    it_behaves_like 'when #all',
                    :response_countries_all_football_data_org, :areas
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', 'Albania',
                    :response_countries_one_football_data_org, :stringify_keys
  end
end

def stubs_countries_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/areas/2002")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/areas")
    .to_return(status: 200, body: get_mocked_response('countries.json', sport, api_name))
end

def response_countries_all_football_data_org
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

def response_countries_one_football_data_org
  {
    "id": 2002,
    "name": "Albania",
    "countryCode": "ALB",
    "ensignUrl": 'null',
    "parentAreaId": 2077,
    "parentArea": "Europe"
  }
end