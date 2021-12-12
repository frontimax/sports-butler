# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Countries do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :countries }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_countries_apifootball_com
  end

  describe 'when #all' do
    it_behaves_like 'when #all',
                    :response_countries_all_apifootball_com, :parsed_response
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', 'England',
                    :response_country_one_apifootball_com, :parsed_response
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end
end

def stubs_countries_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/?APIkey=my_dummy_token&action=get_countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/?APIkey=my_dummy_token&action=get_countries&name=England")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))
end

def response_countries_all_apifootball_com
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

def response_country_one_apifootball_com
  [
    {
      "country_id": "41",
      "country_name": "England",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png"
    }.with_indifferent_access,
  ]
end
