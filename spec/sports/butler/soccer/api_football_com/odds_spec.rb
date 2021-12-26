# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Odds do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :odds }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_odds_api_football_com
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_array', 719371,
                    :response_odds_one_api_football_com, :response
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end

  describe 'when #by_match_and_range' do
    it_behaves_like 'when error_missing_endpoint', :by_match_and_range, { id: 1, from: '2020-01-01', to: '2020-01-01' }
  end
end

def stubs_odds_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/odds?fixture=719371")
    .to_return(status: 200, body: get_mocked_response('odds.json', sport, api_name))
end

def response_odds_one_api_football_com
  [
    {
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2021
      }.with_indifferent_access,
      "fixture": {
        "id": 719371,
        "timezone": "UTC",
        "date": "2021-08-28T13:30:00+00:00",
        "timestamp": 1630157400
      }.with_indifferent_access,
      "update": "2021-08-22T00:25:48+00:00",
      "bookmakers": [
                  {
                    "id": 6,
                    "name": "Bwin",
                    "bets": [
                            {
                              "id": 1,
                              "name": "Match Winner",
                              "values": [
                                      {
                                        "value": "Home",
                                        "odd": "2.00"
                                      }.with_indifferent_access,
                                      {
                                        "value": "Draw",
                                        "odd": "3.60"
                                      }.with_indifferent_access,
                                      {
                                        "value": "Away",
                                        "odd": "3.40"
                                      }.with_indifferent_access
                                    ]
                            }.with_indifferent_access
                          ]
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end

