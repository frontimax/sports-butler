# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Standings do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :standings }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_standings_apifootball_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end

  describe 'when #by_competition' do
    it_behaves_like 'when #by_competition', 149,
                    :response_standings_apifootball_com, :parsed_response
  end
end

def stubs_standings_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_standings&league_id=149")
    .to_return(status: 200, body: get_mocked_response('standings.json', sport, api_name))
end

def response_standings_apifootball_com
  [
    {
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "team_id": "2641",
      "team_name": "Norwich",
      "overall_promotion": "Promotion - Premier League",
      "overall_league_position": "1",
      "overall_league_payed": "44",
      "overall_league_W": "28",
      "overall_league_D": "9",
      "overall_league_L": "7",
      "overall_league_GF": "69",
      "overall_league_GA": "33",
      "overall_league_PTS": "93",
      "home_league_position": "2",
      "home_promotion": "",
      "home_league_payed": "22",
      "home_league_W": "13",
      "home_league_D": "6",
      "home_league_L": "3",
      "home_league_GF": "35",
      "home_league_GA": "14",
      "home_league_PTS": "45",
      "away_league_position": "1",
      "away_promotion": "",
      "away_league_payed": "22",
      "away_league_W": "15",
      "away_league_D": "3",
      "away_league_L": "4",
      "away_league_GF": "34",
      "away_league_GA": "19",
      "away_league_PTS": "48",
      "league_round": "",
      "team_badge": "https://apiv2.apifootball.com/badges/2641_norwich.png"
    }.with_indifferent_access,
    {
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "team_id": "2623",
      "team_name": "Watford",
      "overall_promotion": "Promotion - Premier League",
      "overall_league_position": "2",
      "overall_league_payed": "44",
      "overall_league_W": "26",
      "overall_league_D": "10",
      "overall_league_L": "8",
      "overall_league_GF": "61",
      "overall_league_GA": "28",
      "overall_league_PTS": "88",
      "home_league_position": "1",
      "home_promotion": "",
      "home_league_payed": "22",
      "home_league_W": "18",
      "home_league_D": "2",
      "home_league_L": "2",
      "home_league_GF": "42",
      "home_league_GA": "12",
      "home_league_PTS": "56",
      "away_league_position": "7",
      "away_promotion": "",
      "away_league_payed": "22",
      "away_league_W": "8",
      "away_league_D": "8",
      "away_league_L": "6",
      "away_league_GF": "19",
      "away_league_GA": "16",
      "away_league_PTS": "32",
      "league_round": "",
      "team_badge": "https://apiv2.apifootball.com/badges/2623_watford.png"
    }.with_indifferent_access,
    {
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "team_id": "2644",
      "team_name": "Brentford",
      "overall_promotion": "Promotion - Championship (Play Offs)",
      "overall_league_position": "3",
      "overall_league_payed": "44",
      "overall_league_W": "22",
      "overall_league_D": "15",
      "overall_league_L": "7",
      "overall_league_GF": "74",
      "overall_league_GA": "41",
      "overall_league_PTS": "81",
      "home_league_position": "4",
      "home_promotion": "",
      "home_league_payed": "22",
      "home_league_W": "11",
      "home_league_D": "9",
      "home_league_L": "2",
      "home_league_GF": "37",
      "home_league_GA": "20",
      "home_league_PTS": "42",
      "away_league_position": "2",
      "away_promotion": "",
      "away_league_payed": "22",
      "away_league_W": "11",
      "away_league_D": "6",
      "away_league_L": "5",
      "away_league_GF": "37",
      "away_league_GA": "21",
      "away_league_PTS": "39",
      "league_round": "",
      "team_badge": "https://apiv2.apifootball.com/badges/2644_brentford.png"
    }.with_indifferent_access
  ]
end
