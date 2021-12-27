# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Matches do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :matches }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_matches_football_data_org
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 2002,
                    :response_matches_one_football_data_org, :stringify_keys
  end

  describe 'when #all' do
    it_behaves_like 'when #all',
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_competition' do
    it_behaves_like 'when #by_competition', 2002,
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_competition_and_year' do
    it_behaves_like 'when #by_competition_and_year', 2002, 2020,
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_team' do
    it_behaves_like 'when #by_team', 2002,
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_team_and_status' do
    it_behaves_like 'when #by_team_and_status', 2002, described_class::STATUS_FINISHED,
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_team_finished' do
    it_behaves_like 'when #by_team_finished', 2002,
                    :response_matches_all_football_data_org, :matches
  end

  describe 'when #by_team_scheduled' do
    it_behaves_like 'when #by_team_scheduled', 2002,
                    :response_matches_all_football_data_org, :matches
  end
end

def stubs_matches_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/competitions/2002/matches")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/competitions/2002/matches?season=2020")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams/2002/matches")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams/2002/matches?status=#{described_class::STATUS_FINISHED}")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams/2002/matches?status=#{described_class::STATUS_SCHEDULED}")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', sport, api_name))
end

def response_matches_one_football_data_org
  {
    "head2head": {
      "numberOfMatches": 10,
      "totalGoals": 34,
      "homeTeam": {
        "id": 10,
        "name": "VfB Stuttgart",
        "wins": 1,
        "draws": 0,
        "losses": 9
      }.with_indifferent_access,
      "awayTeam": {
        "id": 5,
        "name": "FC Bayern München",
        "wins": 9,
        "draws": 0,
        "losses": 1
      }.with_indifferent_access
    }.with_indifferent_access,
    "match": {
      "id": 2002,
      "competition": {
        "id": 2002,
        "name": "Bundesliga",
        "area": {
          "name": "Germany",
          "code": "DEU",
          "ensignUrl": "https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg"
        }.with_indifferent_access
      }.with_indifferent_access,
      "season": {
        "id": 228,
        "startDate": "2002-08-09",
        "endDate": "2003-05-24",
        "currentMatchday": "null",
        "winner": {
          "id": 5,
          "name": "FC Bayern München",
          "shortName": "Bayern M",
          "tla": "FCB",
          "crestUrl": "https://crests.football-data.org/5.svg"
        }.with_indifferent_access
      }.with_indifferent_access,
      "utcDate": "2002-12-07T15:30:00Z",
      "status": "FINISHED",
      "venue": "null",
      "matchday": 16,
      "stage": "null",
      "group": "null",
      "lastUpdated": "2018-07-12T16:27:45Z",
      "odds": {
        "msg": "Activate Odds-Package in User-Panel to retrieve odds."
      }.with_indifferent_access,
      "score": {
        "winner": "AWAY_TEAM",
        "duration": "REGULAR",
        "fullTime": {
          "homeTeam": 0,
          "awayTeam": 3
        }.with_indifferent_access,
        "halfTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "extraTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "penalties": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access
      }.with_indifferent_access,
      "homeTeam": {
        "id": 10,
        "name": "VfB Stuttgart"
      }.with_indifferent_access,
      "awayTeam": {
        "id": 5,
        "name": "FC Bayern München"
      }.with_indifferent_access,
      "referees": []
    }.with_indifferent_access
  }.with_indifferent_access
end

def response_matches_all_football_data_org
  {
    "count": 306,
    "filters": {},
    "competition": {
      "id": 2002,
      "area": {
        "id": 2088,
        "name": "Germany"
      },
      "name": "Bundesliga",
      "code": "BL1",
      "plan": "TIER_ONE",
      "lastUpdated": "2021-03-22T01:20:06Z"
    },
    "matches": [
                 {
                   "id": 303007,
                   "season": {
                           "id": 599,
                           "startDate": "2020-09-18",
                           "endDate": "2021-05-15",
                           "currentMatchday": 27
                         }.with_indifferent_access,
                   "utcDate": "2020-09-18T18:30:00Z",
                   "status": "FINISHED",
                   "matchday": 1,
                   "stage": "REGULAR_SEASON",
                   "group": "Regular Season",
                   "lastUpdated": "2020-10-03T07:30:16Z",
                   "odds": {
                           "msg": "Activate Odds-Package in User-Panel to retrieve odds."
                         }.with_indifferent_access,
                   "score": {
                           "winner": "HOME_TEAM",
                           "duration": "REGULAR",
                           "fullTime": {
                                       "homeTeam": 8,
                                       "awayTeam": 0
                                     }.with_indifferent_access,
                           "halfTime": {
                                       "homeTeam": 3,
                                       "awayTeam": 0
                                     }.with_indifferent_access,
                           "extraTime": {
                                       "homeTeam": "null",
                                       "awayTeam": "null"
                                     }.with_indifferent_access,
                           "penalties": {
                                       "homeTeam": "null",
                                       "awayTeam": "null"
                                     }.with_indifferent_access
                         }.with_indifferent_access,
                   "homeTeam": {
                           "id": 5,
                           "name": "FC Bayern München"
                         }.with_indifferent_access,
                   "awayTeam": {
                           "id": 6,
                           "name": "FC Schalke 04"
                         }.with_indifferent_access,
                   "referees": [
                           {
                             "id": 43878,
                             "name": "Felix Zwayer",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 43923,
                             "name": "Thorsten Schiffner",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 43879,
                             "name": "Marco Achmüller",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 57517,
                             "name": "Daniel Schlager",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 57539,
                             "name": "Tobias Welz",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access
                         ]
                 }.with_indifferent_access,
                 {
                   "id": 303002,
                   "season": {
                           "id": 599,
                           "startDate": "2020-09-18",
                           "endDate": "2021-05-15",
                           "currentMatchday": 27
                         }.with_indifferent_access,
                   "utcDate": "2020-09-19T13:30:00Z",
                   "status": "FINISHED",
                   "matchday": 1,
                   "stage": "REGULAR_SEASON",
                   "group": "Regular Season",
                   "lastUpdated": "2020-10-03T07:30:16Z",
                   "odds": {
                           "msg": "Activate Odds-Package in User-Panel to retrieve odds."
                         }.with_indifferent_access,
                   "score": {
                           "winner": "AWAY_TEAM",
                           "duration": "REGULAR",
                           "fullTime": {
                                       "homeTeam": 2,
                                       "awayTeam": 3
                                     }.with_indifferent_access,
                           "halfTime": {
                                       "homeTeam": 1,
                                       "awayTeam": 2
                                     }.with_indifferent_access,
                           "extraTime": {
                                       "homeTeam": "null",
                                       "awayTeam": "null"
                                     }.with_indifferent_access,
                           "penalties": {
                                       "homeTeam": "null",
                                       "awayTeam": "null"
                                     }.with_indifferent_access
                         }.with_indifferent_access,
                   "homeTeam": {
                           "id": 1,
                           "name": "1. FC Köln"
                         }.with_indifferent_access,
                   "awayTeam": {
                           "id": 2,
                           "name": "TSG 1899 Hoffenheim"
                         }.with_indifferent_access,
                   "referees": [
                           {
                             "id": 15408,
                             "name": "Daniel Siebert",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 8826,
                             "name": "Christian Dietz",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 57525,
                             "name": "Marcel Pelgrim",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 57515,
                             "name": "Sören Storks",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access,
                           {
                             "id": 57532,
                             "name": "Frank Willenborg",
                             "role": "REF",
                             "nationality": "Germany"
                           }.with_indifferent_access
                         ]
                 }.with_indifferent_access
               ]
  }

end