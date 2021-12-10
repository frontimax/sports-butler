# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Countries do
  before do
    ConfigHelpers.set_apifootball_com
    stubs_countries_apifootball
  end

  describe 'when #all' do
    it_behaves_like 'when #all', :soccer, :apifootball_com, :countries, Array,
                    :response_areas_apifootball, :parsed_response
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', :soccer, :apifootball_com, :countries, 'England', Array,
                    :response_area_apifootball, :parsed_response
  end
end

def stubs_countries_apifootball
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:apifootball_com]}/?APIkey=my_dummy_token&action=get_countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', :soccer, :apifootball_com))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:apifootball_com]}/?APIkey=my_dummy_token&action=get_countries&name=England")
    .to_return(status: 200, body: get_mocked_response('country.json', :soccer, :apifootball_com))
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

def response_area_apifootball
  [
    {
      "country_id": "41",
      "country_name": "England",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png"
    }.with_indifferent_access,
  ]
end
