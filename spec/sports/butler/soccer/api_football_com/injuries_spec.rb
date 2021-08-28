# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Injuries do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :injuries }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_injuries_api_football_com
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_array', 1540,
                    :response_injuries_one_api_football_com
  end

  describe 'when #by_competition_and_season' do
    it_behaves_like 'when #by_competition_and_season', 1540, 2021,
                    :response_injuries_one_api_football_com
  end

  describe 'when #by_team_and_season' do
    it_behaves_like 'when #by_team_and_season', 2210, 2021,
                    :response_injuries_one_api_football_com
  end
end

def stubs_injuries_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/injuries?id=1540")
    .to_return(status: 200, body: get_mocked_response('injuries.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/injuries?league=1540&season=2021")
    .to_return(status: 200, body: get_mocked_response('injuries.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/injuries?team=2210&season=2021")
    .to_return(status: 200, body: get_mocked_response('injuries.json', sport, api_name))
end

def response_injuries_one_api_football_com
  [
    {
      "player": {
        "id": 25333,
        "name": "R. Jarstein",
        "photo": "https://media.api-sports.io/football/players/25333.png",
        "type": "Missing Fixture",
        "reason": "Heart Problems"
      }.with_indifferent_access,
      "team": {
        "id": 159,
        "name": "Hertha Berlin",
        "logo": "https://media.api-sports.io/football/teams/159.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 1651,
        "name": "K. Piatek",
        "photo": "https://media.api-sports.io/football/players/1651.png",
        "type": "Missing Fixture",
        "reason": "Ankle Injury"
      }.with_indifferent_access,
      "team": {
        "id": 159,
        "name": "Hertha Berlin",
        "logo": "https://media.api-sports.io/football/teams/159.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 148284,
        "name": "B. Bialek",
        "photo": "https://media.api-sports.io/football/players/148284.png",
        "type": "Missing Fixture",
        "reason": "Knee Injury"
      }.with_indifferent_access,
      "team": {
        "id": 161,
        "name": "VfL Wolfsburg",
        "logo": "https://media.api-sports.io/football/teams/161.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 25208,
        "name": "P. Otavio",
        "photo": "https://media.api-sports.io/football/players/25208.png",
        "type": "Missing Fixture",
        "reason": "Ankle Injury"
      }.with_indifferent_access,
      "team": {
        "id": 161,
        "name": "VfL Wolfsburg",
        "logo": "https://media.api-sports.io/football/teams/161.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
