# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Countries do
  before do
    ConfigHelpers.set_api_basketball_com
    stubs_countries_api_dash_basketball
  end

  let(:api) { Sports::Butler::Api.new(:basketball, :api_basketball_com) }

  describe 'when all' do
    it_behaves_like 'when #all', :basketball, :api_basketball_com, :countries, Hash,
                    :response_areas_api_dash_basketball
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', :basketball, :api_basketball_com, :countries, 'Albania', Hash,
                    :response_area_api_dash_basketball
  end
end

def stubs_countries_api_dash_basketball
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:basketball][:api_basketball_com]}/countries?name=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', :basketball, :api_basketball_com))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:basketball][:api_basketball_com]}/countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', :basketball, :api_basketball_com))
end

def response_area_api_dash_basketball
  [
    {
      "name": "Albania",
      "code": "AL",
      "flag": "https://media.api-sports.io/flags/al.svg"
    }.with_indifferent_access
  ]
end

def response_areas_all_api_dash_basketball
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

def response_areas_api_dash_basketball
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
