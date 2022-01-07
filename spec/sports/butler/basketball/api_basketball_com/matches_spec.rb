# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Matches do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :matches }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_matches_api_basketball_com
  end

  describe 'when #by_competition_and_year' do
    it_behaves_like 'when #by_competition_and_year', 13, 2021, :response_matches_all_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when #all', :response_matches_all_api_basketball_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 126634, :response_matches_one_api_basketball_com
  end

end

def stubs_matches_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/games")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/games?league=13&season=2021")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/games?id=126634")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))
end

def response_matches_all_api_basketball_com
  [
    {
      "id": 126634,
      "date": "2021-05-14T23:00:00+00:00",
      "time": "23:00",
      "timestamp": 1621033200,
      "timezone": "UTC",
      "stage": "",
      "week": "",
      "status": {
        "long": "Game Finished",
        "short": "FT",
        "timer": ""
      }.with_indifferent_access.with_indifferent_access,
      "league": {
        "id": 13,
        "name": "NBA W",
        "type": "League",
        "season": 2021,
        "logo": "https://media.api-sports.io/basketball/leagues/13.png"
      }.with_indifferent_access,
      "country": {
        "id": 5,
        "name": "USA",
        "code": "US",
        "flag": "https://media.api-sports.io/flags/us.svg"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 170,
          "name": "New York Liberty W",
          "logo": "https://media.api-sports.io/basketball/teams/170.png"
        }.with_indifferent_access,
        "away": {
          "id": 166,
          "name": "Indiana Fever W",
          "logo": "https://media.api-sports.io/basketball/teams/166.png"
        }.with_indifferent_access
      }.with_indifferent_access,
      "scores": {
        "home": {
          "quarter_1": 26,
          "quarter_2": 21,
          "quarter_3": 21,
          "quarter_4": 22,
          "over_time": "",
          "total": 90
        }.with_indifferent_access,
        "away": {
          "quarter_1": 21,
          "quarter_2": 26,
          "quarter_3": 17,
          "quarter_4": 23,
          "over_time": "",
          "total": 87
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "id": 126635,
      "date": "2021-05-14T23:30:00+00:00",
      "time": "23:30",
      "timestamp": 1621035000,
      "timezone": "UTC",
      "stage": "",
      "week": "",
      "status": {
        "long": "Game Finished",
        "short": "FT",
        "timer": ""
      }.with_indifferent_access,
      "league": {
        "id": 13,
        "name": "NBA W",
        "type": "League",
        "season": 2021,
        "logo": "https://media.api-sports.io/basketball/leagues/13.png"
      }.with_indifferent_access,
      "country": {
        "id": 5,
        "name": "USA",
        "code": "US",
        "flag": "https://media.api-sports.io/flags/us.svg"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 162,
          "name": "Atlanta Dream W",
          "logo": "https://media.api-sports.io/basketball/teams/162.png"
        }.with_indifferent_access,
        "away": {
          "id": 164,
          "name": "Connecticut Sun W",
          "logo": "https://media.api-sports.io/basketball/teams/164.png"
        }.with_indifferent_access
      }.with_indifferent_access,
      "scores": {
        "home": {
          "quarter_1": 17,
          "quarter_2": 16,
          "quarter_3": 16,
          "quarter_4": 18,
          "over_time": "",
          "total": 67
        }.with_indifferent_access,
        "away": {
          "quarter_1": 22,
          "quarter_2": 21,
          "quarter_3": 19,
          "quarter_4": 16,
          "over_time": "",
          "total": 78
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end

def response_matches_one_api_basketball_com
  [
    {
      "id": 126638,
      "date": "2021-05-15T17:00:00+00:00",
      "time": "17:00",
      "timestamp": 1621098000,
      "timezone": "UTC",
      "stage": "",
      "week": "",
      "status": {
        "long": "Game Finished",
        "short": "FT",
        "timer": ""
      }.with_indifferent_access,
      "league": {
        "id": 13,
        "name": "NBA W",
        "type": "League",
        "season": 2021,
        "logo": "https://media.api-sports.io/basketball/leagues/13.png"
      }.with_indifferent_access,
      "country": {
        "id": 5,
        "name": "USA",
        "code": "US",
        "flag": "https://media.api-sports.io/flags/us.svg"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 175,
          "name": "Washington Mystics W",
          "logo": "https://media.api-sports.io/basketball/teams/175.png"
        }.with_indifferent_access,
        "away": {
          "id": 163,
          "name": "Chicago Sky W",
          "logo": "https://media.api-sports.io/basketball/teams/163.png"
        }.with_indifferent_access
      }.with_indifferent_access,
      "scores": {
        "home": {
          "quarter_1": 19,
          "quarter_2": 11,
          "quarter_3": 10,
          "quarter_4": 16,
          "over_time": "",
          "total": 56
        }.with_indifferent_access,
        "away": {
          "quarter_1": 22,
          "quarter_2": 24,
          "quarter_3": 11,
          "quarter_4": 13,
          "over_time": "",
          "total": 70
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end