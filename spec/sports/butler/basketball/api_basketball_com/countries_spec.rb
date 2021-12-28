# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Countries do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :countries }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_countries_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when #all',
                    :response_countries_all_api_basketball_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', 'Germany',
                    :response_countries_one_api_basketball_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 17,
                    :response_countries_one_api_basketball_com
  end

  describe 'when #search_by_name' do
    it_behaves_like 'when #search_by_name', 'Germ',
                    :response_countries_one_api_basketball_com
  end

  describe 'when #by_code' do
    it_behaves_like 'when #by_code', 'DE',
                    :response_countries_one_api_basketball_com
  end
end

def stubs_countries_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/countries?name=Germany")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/countries?id=17")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/countries?code=DE")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/countries?search=Germ")
    .to_return(status: 200, body: get_mocked_response('country.json', sport, api_name))
end

def response_countries_one_api_basketball_com
  [
    {
      "id": 17,
      "name": "Germany",
      "code": "DE",
      "flag": "https://media.api-sports.io/flags/de.svg"
    }.with_indifferent_access
  ]
end

def response_countries_all_api_basketball_com
  [
    {
      "id": 1,
      "name": "Australia",
      "code": "AU",
      "flag": "https://media.api-sports.io/flags/au.svg"
    }.with_indifferent_access,
    {
      "id": 2,
      "name": "Asia",
      "code": "AS",
      "flag": "https://media.api-sports.io/flags/as.svg"
    }.with_indifferent_access,
    {
      "id": 3,
      "name": "Austria",
      "code": "AT",
      "flag": "https://media.api-sports.io/flags/at.svg"
    }.with_indifferent_access
  ]
end
