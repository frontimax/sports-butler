# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Countries do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :countries }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_countries_api_football_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_countries_all_api_football_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', 'Albania', :response_countries_one_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end

  describe 'when #search_by_name' do
    it_behaves_like 'when #search_by_name', 'Alb',
                    :response_countries_one_api_football_com
  end

  describe 'when #by_area' do
    it_behaves_like 'when error_missing_endpoint', :by_area, { area: 'Germany' }
  end
end

def stubs_countries_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/countries?name=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/countries?name=Alb")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))
end

def response_countries_one_api_football_com
  [
    {
      "name": "Albania",
      "code": "AL",
      "flag": "https://media.api-sports.io/flags/al.svg"
    }.with_indifferent_access
  ]
end

def response_countries_all_api_football_com
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
