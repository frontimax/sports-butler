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

  describe 'when #all' do
    it_behaves_like 'when #all', :response_competitions_all_api_football_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Bundesliga' }
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 78, :response_competitions_one_api_football_com
  end

  describe 'when #search_by_name' do
    it_behaves_like 'when #search_by_name', 'Bundes', :response_competitions_one_api_football_com
  end

  describe 'when #by_country_name' do
    it_behaves_like 'when #by_country_name', 'Germany', :response_competitions_one_api_football_com
  end

  describe 'when #seasons' do
    it 'returns seasons array' do
      butler    = Sports::Butler.new(sport: sport, api_name: api_name)
      result    = butler.send(endpoint).seasons

      expect(result).to be_a(Sports::Butler::Api)
      expect(result.response).to be_a(HTTParty::Response)
      expect(result.response.parsed_response).to be_a(response_type)
      expect(result.response.parsed_response['response']).to be_a(Array)
      expect(result.response.parsed_response['response']).to match_array(response_competitions_seasons_api_football_com)
    end
  end

  describe 'when #leagues' do
    it_behaves_like 'when #leagues', :response_competitions_all_api_football_com
  end

  describe 'when #cups' do
    it_behaves_like 'when #cups', :response_competitions_all_api_football_com
  end
end

def stubs_competitions_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues?id=78")
    .to_return(status: 200, body: get_mocked_response('competition.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues?name=Bundes")
    .to_return(status: 200, body: get_mocked_response('competition.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues?country=Germany")
    .to_return(status: 200, body: get_mocked_response('competition.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues/seasons")
    .to_return(status: 200, body: get_mocked_response('seasons.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues?type=league")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/leagues?type=cup")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))
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

def response_competitions_seasons_api_football_com
  [
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023
  ]
end