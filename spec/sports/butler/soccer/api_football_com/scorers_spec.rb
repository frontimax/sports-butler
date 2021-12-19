# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Scorers do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :scorers }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_scorers_api_football_com
  end

  describe 'when #by_competition_and_year' do
    it_behaves_like 'when #by_competition_and_year', 78, 2020,
                    :response_scorers_one_api_football_com, :response
  end
end

def stubs_scorers_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/players/topscorers?league=78&season=2020")
    .to_return(status: 200, body: get_mocked_response('scorers.json', sport, api_name))
end

def response_scorers_one_api_football_com
  [
    {
      "player": {
        "id": 521,
        "name": "R. Lewandowski",
        "firstname": "Robert",
        "lastname": "Lewandowski",
        "age": 33,
        "birth": {
          "date": "1988-08-21",
          "place": "Warszawa",
          "country": "Poland"
        },
        "nationality": "Poland",
        "height": "184 cm",
        "weight": "80 kg",
        "injured": false,
        "photo": "https://media.api-sports.io/football/players/521.png"
      }.with_indifferent_access,
      "statistics": [
                  {
                    "team": {
                      "id": 157,
                      "name": "Bayern Munich",
                      "logo": "https://media.api-sports.io/football/teams/157.png"
                    }.with_indifferent_access,
                    "league": {
                      "id": 78,
                      "name": "Bundesliga 1",
                      "country": "Germany",
                      "logo": "https://media.api-sports.io/football/leagues/78.png",
                      "flag": "https://media.api-sports.io/flags/de.svg",
                      "season": 2020
                    }.with_indifferent_access,
                    "games": {
                      "appearences": 29,
                      "lineups": 28,
                      "minutes": 2463,
                      "number": "",
                      "position": "Attacker",
                      "rating": "7.841379",
                      "captain": false
                    }.with_indifferent_access,
                    "substitutes": {
                      "in": 1,
                      "out": 6,
                      "bench": 1
                    }.with_indifferent_access,
                    "shots": {
                      "total": 116,
                      "on": 68
                    }.with_indifferent_access,
                    "goals": {
                      "total": 41,
                      "conceded": 0,
                      "assists": 7,
                      "saves": ""
                    }.with_indifferent_access,
                    "passes": {
                      "total": 661,
                      "key": 32,
                      "accuracy": 17
                    }.with_indifferent_access,
                    "tackles": {
                      "total": 15,
                      "blocks": 1,
                      "interceptions": 3
                    }.with_indifferent_access,
                    "duels": {
                      "total": 281,
                      "won": 110
                    }.with_indifferent_access,
                    "dribbles": {
                      "attempts": 43,
                      "success": 22,
                      "past": ""
                    }.with_indifferent_access,
                    "fouls": {
                      "drawn": 29,
                      "committed": 41
                    }.with_indifferent_access,
                    "cards": {
                      "yellow": 4,
                      "yellowred": 0,
                      "red": 0
                    }.with_indifferent_access,
                    "penalty": {
                      "won": "",
                      "commited": "",
                      "scored": 8,
                      "missed": 1,
                      "saved": ""
                    }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end

