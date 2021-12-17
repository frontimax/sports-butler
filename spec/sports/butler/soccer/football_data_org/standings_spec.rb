# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Standings do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :standings }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_standings_football_data_org
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end

  describe 'when #by_competition' do
    it_behaves_like 'when #by_competition', 2002,
                    :response_standings_football_data_org, :standings
  end
end

def stubs_standings_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/standings?competition_id=2002")
    .to_return(status: 200, body: get_mocked_response('standings.json', sport, api_name))
end

def response_standings_football_data_org
  {
    "filters": {},
    "competition": {
      "id": 2002,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Bundesliga",
      "code": "BL1",
      "plan": "TIER_ONE",
      "lastUpdated": "2021-04-10T14:04:43Z"
    }.with_indifferent_access,
    "season": {
      "id": 599,
      "startDate": "2020-09-18",
      "endDate": "2021-05-15",
      "currentMatchday": 28,
      "winner": "null"
    }.with_indifferent_access,
    "standings": [
                 {
                   "stage": "REGULAR_SEASON",
                   "type": "TOTAL",
                   "group": "null",
                   "table": [
                              {
                                "position": 1,
                                "team": {
                                  "id": 5,
                                  "name": "FC Bayern München",
                                  "crestUrl": "https://crests.football-data.org/5.svg"
                                }.with_indifferent_access,
                                "playedGames": 28,
                                "form": "W,W,W,W,W",
                                "won": 20,
                                "draw": 5,
                                "lost": 3,
                                "points": 65,
                                "goalsFor": 79,
                                "goalsAgainst": 35,
                                "goalDifference": 44
                              }.with_indifferent_access,
                              {
                                "position": 2,
                                "team": {
                                  "id": 721,
                                  "name": "RB Leipzig",
                                  "crestUrl": "https://crests.football-data.org/721.svg"
                                }.with_indifferent_access,
                                "playedGames": 28,
                                "form": "L,W,D,W,W",
                                "won": 18,
                                "draw": 6,
                                "lost": 4,
                                "points": 60,
                                "goalsFor": 50,
                                "goalsAgainst": 22,
                                "goalDifference": 28
                              }.with_indifferent_access,
                              {
                                "position": 3,
                                "team": {
                                  "id": 11,
                                  "name": "VfL Wolfsburg",
                                  "crestUrl": "https://crests.football-data.org/11.svg"
                                }.with_indifferent_access,
                                "playedGames": 28,
                                "form": "W,W,W,L,W",
                                "won": 15,
                                "draw": 9,
                                "lost": 4,
                                "points": 54,
                                "goalsFor": 47,
                                "goalsAgainst": 24,
                                "goalDifference": 23
                              }.with_indifferent_access
                            ]
                 }.with_indifferent_access
               ]
  }.with_indifferent_access
end
