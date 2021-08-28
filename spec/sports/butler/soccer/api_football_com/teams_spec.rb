# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Teams do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :teams }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_teams_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 39,
                    :response_team_one_api_football_com
  end
end

def stubs_teams_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/teams?id=39")
    .to_return(status: 200, body: get_mocked_response('team.json', sport, api_name))
end

def response_team_one_api_football_com
  [
    {
      "team": {
        "id": 39,
        "name": "Wolves",
        "country": "England",
        "founded": 1877,
        "national": false,
        "logo": "https://media.api-sports.io/football/teams/39.png"
      }.with_indifferent_access,
      "venue": {
        "id": 600,
        "name": "Molineux Stadium",
        "address": "Waterloo Road",
        "city": "Wolverhampton, West Midlands",
        "capacity": 32050,
        "surface": "grass",
        "image": "https://media.api-sports.io/football/venues/600.png"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
