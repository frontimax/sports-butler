# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Players do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :players }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_players_football_data_org
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 44,
                    :response_players_one_football_data_org, :stringify_keys
  end

  describe 'when #by_id_and_season' do
    it_behaves_like 'when error_missing_endpoint', :by_id_and_season, { id: 1, season: '2019' }
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Test' }
  end
end

def stubs_players_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/players/44")
    .to_return(status: 200, body: get_mocked_response('player.json', sport, api_name))
end

def response_players_one_football_data_org
  {
    "id": 44,
    "name": "Cristiano Ronaldo",
    "firstName": "Cristiano Ronaldo",
    "lastName": "null",
    "dateOfBirth": "1985-02-05",
    "countryOfBirth": "Portugal",
    "nationality": "Portugal",
    "position": "Attacker",
    "shirtNumber": "null",
    "lastUpdated": "2020-11-26T02:19:40Z"
  }
end