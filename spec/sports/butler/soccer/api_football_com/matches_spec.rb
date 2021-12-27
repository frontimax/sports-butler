# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Matches do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :matches }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_matches_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 587177,
                    :response_matches_one_api_football_com
  end

  describe 'when #by_competition_and_year' do
    it_behaves_like 'when #by_competition_and_year', 587177, 2020,
                    :response_matches_one_api_football_com, :response
  end

  describe 'when #all' do
    it_behaves_like 'when #all', :response_matches_all_api_football_com
  end
end

def stubs_matches_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/fixtures?id=587177")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/fixtures?league=587177&season=2020")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/fixtures")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))
end

def response_matches_one_api_football_com
  [
    {
      "fixture": {
        "id": 587177,
        "referee": "F. Brych",
        "timezone": "UTC",
        "date": "2020-09-19T16:30:00+00:00",
        "timestamp": 1600533000,
        "periods": {
          "first": 1600533000,
          "second": 1600536600
        }.with_indifferent_access,
        "venue": {
          "id": 702,
          "name": "Signal-Iduna-Park",
          "city": "Dortmund"
        }.with_indifferent_access,
        "status": {
          "long": "Match Finished",
          "short": "FT",
          "elapsed": 90
        }.with_indifferent_access
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2020,
        "round": "Regular Season - 1"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 165,
          "name": "Borussia Dortmund",
          "logo": "https://media.api-sports.io/football/teams/165.png",
          "winner": true
        }.with_indifferent_access,
        "away": {
          "id": 163,
          "name": "Borussia Monchengladbach",
          "logo": "https://media.api-sports.io/football/teams/163.png",
          "winner": false
        }.with_indifferent_access
      }.with_indifferent_access,
      "goals": {
        "home": 3,
        "away": 0
      }.with_indifferent_access,
      "score": {}.with_indifferent_access,
      "events": [],
      "lineups": [],
      "statistics": [],
      "players": []
    }.with_indifferent_access
  ]
end

def response_matches_all_api_football_com
  [
    {
      "fixture": {
        "id": 587176,
        "referee": "F. Zwayer",
        "timezone": "UTC",
        "date": "2020-09-18T18:30:00+00:00",
        "timestamp": 1600453800,
        "periods": {
          "first": 1600453800,
          "second": 1600457400
        }.with_indifferent_access,
        "venue": {
          "id": 700,
          "name": "Allianz Arena",
          "city": "München"
        }.with_indifferent_access,
        "status": {
          "long": "Match Finished",
          "short": "FT",
          "elapsed": 90
        }.with_indifferent_access
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2020,
        "round": "Regular Season - 1"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 157,
          "name": "Bayern Munich",
          "logo": "https://media.api-sports.io/football/teams/157.png",
          "winner": true
        }.with_indifferent_access,
        "away": {
          "id": 174,
          "name": "FC Schalke 04",
          "logo": "https://media.api-sports.io/football/teams/174.png",
          "winner": false
        }.with_indifferent_access
      }.with_indifferent_access,
      "goals": {
        "home": 8,
        "away": 0
      }.with_indifferent_access,
      "score": {
        "halftime": {
          "home": 3,
          "away": 0
        }.with_indifferent_access,
        "fulltime": {
          "home": 8,
          "away": 0
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