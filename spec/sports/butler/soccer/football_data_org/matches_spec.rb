# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Matches do
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
end

def stubs_matches_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))
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