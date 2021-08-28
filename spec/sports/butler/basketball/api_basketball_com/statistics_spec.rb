# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Statistics do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :statistics }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_statistics_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when error_missing_endpoint', :all
  end

  describe 'when #by_competition_and_team_and_season' do
    it_behaves_like 'when #by_competition_and_team_and_season', 1, 1, 2020, :response_statistics_all_api_basketball_com
  end

end

def stubs_statistics_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/statistics?season=2020&league=1&team=1")
    .to_return(status: 200, body: get_mocked_response('statistics.json', sport, api_name))
end

def response_statistics_all_api_basketball_com
  {
    "country": {
      "id": '',
      "name": '',
      "code": '',
      "flag": ''
    }.with_indifferent_access,
    "league": {
      "id": '',
      "name": '',
      "type": '',
      "season": '',
      "logo": ''
    }.with_indifferent_access,
    "team": {
      "id": 1,
      "name": "Melbourne United",
      "logo": "https://media.api-sports.io/basketball/teams/1.png"
    }.with_indifferent_access,
    "games": {
      "played": {
        "home": 0,
        "away": 0,
        "all": 0
      }.with_indifferent_access,
      "wins": {
        "home": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "away": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "all": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access
      }.with_indifferent_access,
      "draws": {
        "home": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "away": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "all": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access
      }.with_indifferent_access,
      "loses": {
        "home": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "away": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access,
        "all": {
          "total": 0,
          "percentage": ''
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access,
    "points": {
      "for": {
        "total": {
          "home": 0,
          "away": 0,
          "all": 0
        }.with_indifferent_access,
        "average": {
          "home": "0.0",
          "away": "0.0",
          "all": "0.0"
        }.with_indifferent_access
      }.with_indifferent_access,
      "against": {
        "total": {
          "home": 0,
          "away": 0,
          "all": 0
        }.with_indifferent_access,
        "average": {
          "home": "0.0",
          "away": "0.0",
          "all": "0.0"
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  }.with_indifferent_access
end
