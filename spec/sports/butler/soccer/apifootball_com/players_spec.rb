# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Players do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :players }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_players_apifootball_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 4068429598,
                    :response_players_one_apifootball_com, :parsed_response
  end
end

def stubs_players_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/?APIkey=my_dummy_token&action=get_players&player_id=4068429598")
    .to_return(status: 200, body: get_mocked_response('player.json', sport, api_name))
end

def response_players_one_apifootball_com
  [
    {
      "player_key": 4068429598,
      "player_name": "El Mhamdi Salaheddine",
      "player_number": "",
      "player_country": "Netherlands",
      "player_type": "Forwards",
      "player_age": "24",
      "player_match_played": "0",
      "player_goals": "0",
      "player_yellow_cards": "0",
      "player_red_cards": "0",
      "team_name": "Westlandia",
      "team_key": "5141"
    }.with_indifferent_access
  ]
end