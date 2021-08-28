# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Odds do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :odds }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_odds_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when error_missing_endpoint', :all
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_array', 6, :response_odds_all_api_basketball_com
  end

end

def stubs_odds_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/odds?game=6")
    .to_return(status: 200, body: get_mocked_response('odds.json', sport, api_name))
end

def response_odds_all_api_basketball_com
  [
    {
      "league": {
        "id": 1,
        "name": "NBA",
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
