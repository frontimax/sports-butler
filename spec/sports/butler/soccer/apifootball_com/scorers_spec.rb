# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Scorers do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :scorers }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_scorers_apifootball_com
  end

  describe 'when #by_competition' do
    it_behaves_like 'when #by_competition', 302,
                    :response_scorers_all_apifootball_com, :parsed_response
  end
end

def stubs_scorers_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_topscorers&competition_id=302")
    .to_return(status: 200, body: get_mocked_response('scorers.json', sport, api_name))
end

def response_scorers_all_apifootball_com
  [
    {
      "player_place": "1",
      "player_name": "L. Messi",
      "player_key": 1135663375,
      "team_name": "Barcelona",
      "team_key": "97",
      "goals": "30",
      "assists": "9",
      "penalty_goals": "3"
    }.with_indifferent_access,
    {
      "player_place": "2",
      "player_name": "Gerard Moreno",
      "player_key": 387294631,
      "team_name": "Villarreal",
      "team_key": "162",
      "goals": "23",
      "assists": "",
      "penalty_goals": "10"
    }.with_indifferent_access
  ]
end