# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Competitions do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :competitions }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_competitions_api_football_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_competitions_all_api_football_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Bundesliga' }
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 78,
                    :response_competitions_one_api_football_com
  end
end

def stubs_competitions_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/leagues")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/leagues?id=78")
    .to_return(status: 200, body: get_mocked_response('competition.json', sport, api_name))
end

def aaa
  :api_football_com
end

def response_competitions_one_api_football_com
  [
    {
      "league": {
                  "id": 78,
                  "name": "Bundesliga 1",
                  "type": "League",
                  "logo": "https://media.api-sports.io/football/leagues/78.png"
                }.with_indifferent_access,
      "country": {
                  "name": "Germany",
                  "code": "DE",
                  "flag": "https://media.api-sports.io/flags/de.svg"
                }.with_indifferent_access,
      "seasons": [
                  {
                    "year": 2020,
                    "start": "2020-09-18",
                    "end": "2021-05-29",
                    "current": false,
                    "coverage": {
                              "fixtures": {
                                            "events": true,
                                            "lineups": true,
                                            "statistics_fixtures": true,
                                            "statistics_players": true
                                          }.with_indifferent_access,
                              "standings": true,
                              "players": true,
                              "top_scorers": true,
                              "top_assists": true,
                              "top_cards": true,
                              "injuries": true,
                              "predictions": true,
                              "odds": false
                            }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "year": 2021,
                    "start": "2021-08-13",
                    "end": "2022-05-14",
                    "current": true,
                    "coverage": {
                              "fixtures": {
                                            "events": true,
                                            "lineups": true,
                                            "statistics_fixtures": true,
                                            "statistics_players": true
                                          }.with_indifferent_access,
                              "standings": true,
                              "players": true,
                              "top_scorers": true,
                              "top_assists": true,
                              "top_cards": true,
                              "injuries": false,
                              "predictions": true,
                              "odds": true
                            }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end

def response_competitions_all_api_football_com
  [
    {
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "type": "League",
        "logo": "https://media.api-sports.io/football/leagues/78.png"
      }.with_indifferent_access,
      "country": {
        "name": "Germany",
        "code": "DE",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access,
      "seasons": [
                  {
                    "year": 2020,
                    "start": "2020-09-18",
                    "end": "2021-05-29",
                    "current": false,
                    "coverage": {
                      "fixtures": {
                        "events": true,
                        "lineups": true,
                        "statistics_fixtures": true,
                        "statistics_players": true
                      }.with_indifferent_access,
                      "standings": true,
                      "players": true,
                      "top_scorers": true,
                      "top_assists": true,
                      "top_cards": true,
                      "injuries": true,
                      "predictions": true,
                      "odds": false
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "year": 2021,
                    "start": "2021-08-13",
                    "end": "2022-05-14",
                    "current": true,
                    "coverage": {
                      "fixtures": {
                        "events": true,
                        "lineups": true,
                        "statistics_fixtures": true,
                        "statistics_players": true
                      }.with_indifferent_access,
                      "standings": true,
                      "players": true,
                      "top_scorers": true,
                      "top_assists": true,
                      "top_cards": true,
                      "injuries": false,
                      "predictions": true,
                      "odds": true
                    }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end
