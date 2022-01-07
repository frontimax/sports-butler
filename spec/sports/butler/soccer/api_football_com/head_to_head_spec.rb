# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::HeadToHead do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :head_to_head }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_head_to_head_api_football_com
  end

  describe 'when #by_teams' do
    it_behaves_like 'when #by_teams', 1, 2,
                    :response_head_to_head_one_api_football_com, :response
  end
end

def stubs_head_to_head_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/fixtures/headtohead?second_team_id=2&team_id=1")
    .to_return(status: 200, body: get_mocked_response('head_to_head.json', sport, api_name))
end

def response_head_to_head_one_api_football_com
  [
    {
      "fixture": {
        "id": 135797,
        "referee": "Antonio Mateu, Spain",
        "timezone": "UTC",
        "date": "2018-06-21T12:00:00+00:00",
        "timestamp": 1529582400,
        "periods": {
          "first": 1529582400,
          "second": 1529586000
        }.with_indifferent_access,
        "venue": {
          "id": "",
          "name": "Samara Arena",
          "city": "Samara"
        }.with_indifferent_access,
        "status": {
          "long": "Match Finished",
          "short": "FT",
          "elapsed": 90
        }.with_indifferent_access
      }.with_indifferent_access,
      "league": {
        "id": 1,
        "name": "World Cup",
        "country": "World",
        "logo": "https://media.api-sports.io/football/leagues/1.png",
        "flag": "",
        "season": 2018,
        "round": "Group Stage - 2"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 21,
          "name": "Denmark",
          "logo": "https://media.api-sports.io/football/teams/21.png",
          "winner": ""
        }.with_indifferent_access,
        "away": {
          "id": 20,
          "name": "Australia",
          "logo": "https://media.api-sports.io/football/teams/20.png",
          "winner": ""
        }.with_indifferent_access
      }.with_indifferent_access,
      "goals": {
        "home": 1,
        "away": 1
      }.with_indifferent_access,
      "score": {
        "halftime": {
          "home": 1,
          "away": 1
        }.with_indifferent_access,
        "fulltime": {
          "home": 1,
          "away": 1
        }.with_indifferent_access,
        "extratime": {
          "home": "",
          "away": ""
        }.with_indifferent_access,
        "penalty": {
          "home": "",
          "away": ""
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end

