# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Matches do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :matches }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_matches_apifootball_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 205430,
                    :response_matches_one_apifootball_com, :parsed_response
  end

  describe 'when #by_competition_and_year' do
    it_behaves_like 'when #by_competition_and_year', 1, 2020,
                    :response_matches_all_apifootball_com, :parsed_response
  end

  describe 'when #by_team_and_range' do
    it_behaves_like 'when #by_team_and_range', 1, '2021-01-01', '2021-06-30',
                    :response_matches_all_apifootball_com, :parsed_response
  end

  describe 'when #by_competition_and_range' do
    it_behaves_like 'when #by_competition_and_range', 1, '2021-01-01', '2021-06-30',
                    :response_matches_all_apifootball_com, :parsed_response
  end
end

def stubs_matches_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_events&match_id=205430")
    .to_return(status: 200, body: get_mocked_response('match.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_events&from=2021-01-01&league_id=1&to=2021-06-30")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_events&from=2020-01-01&league_id=1&to=2020-12-31")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_events&from=2021-01-01&team_id=1&to=2021-06-30")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_events&league_id=1")
    .to_return(status: 200, body: get_mocked_response('matches.json', sport, api_name))
end

def response_matches_one_apifootball_com
  [{
    "match_id": "205430",
    "country_id": "41",
    "country_name": "England",
    "league_id": "149",
    "league_name": "Championship",
    "match_date": "2019-04-27",
    "match_status": "Finished",
    "match_time": "14:30",
    "match_hometeam_id": "2638",
    "match_hometeam_name": "Millwall",
    "match_hometeam_score": "0",
    "match_awayteam_name": "Stoke",
    "match_awayteam_id": "2624",
    "match_awayteam_score": "0",
    "match_hometeam_halftime_score": "0",
    "match_awayteam_halftime_score": "0",
    "match_hometeam_extra_score": "",
    "match_awayteam_extra_score": "",
    "match_hometeam_penalty_score": "",
    "match_awayteam_penalty_score": "",
    "match_hometeam_ft_score": "",
    "match_awayteam_ft_score": "",
    "match_hometeam_system": "4 - 1 - 4 - 1",
    "match_awayteam_system": "3 - 4 - 3",
    "match_live": "0",
    "match_round": "Round 45",
    "match_stadium": "",
    "match_referee": "",
    "team_home_badge": "https://apiv2.apifootball.com/badges/2638_millwall.png",
    "team_away_badge": "https://apiv2.apifootball.com/badges/2624_stoke-city.png",
    "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png",
    "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png",
    "goalscorer": [],
    "cards": [
                  {
                    "time": "74",
                    "home_fault": "",
                    "card": "yellow card",
                    "away_fault": "Shawcross R.",
                    "info": ""
                  }.with_indifferent_access
                ],
    "substitutions": {
      "home": [
                {
                  "time": "66",
                  "substitution": "Marshall B. | Morison S."
                }.with_indifferent_access
              ],
      "away": [
                {
                  "time": "76",
                  "substitution": "Ince T. | Vokes S."
                }.with_indifferent_access
              ]
    }.with_indifferent_access,
    "lineup": {
      "home": {
        "starting_lineups": [
                              {
                                "lineup_player": "Cooper J.",
                                "lineup_number": "5",
                                "lineup_position": "4",
                                "player_key": "183782679"
                              }.with_indifferent_access
                            ],
        "coach": [
                              {
                                "lineup_player": "Jones N.",
                                "lineup_number": "-1",
                                "lineup_position": "",
                                "player_key": "2874574677"
                              }.with_indifferent_access
                            ],
        "missing_players": []
      }.with_indifferent_access
    }.with_indifferent_access,
    "statistics": [
                  {
                    "type": "Ball Possession",
                    "home": "37%",
                    "away": "63%"
                  }.with_indifferent_access
                ]
  }.with_indifferent_access]
end

def response_matches_all_apifootball_com
  [
    {
      "match_id": "205430",
      "country_id": "41",
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "match_date": "2019-04-27",
      "match_status": "Finished",
      "match_time": "14:30",
      "match_hometeam_id": "2638",
      "match_hometeam_name": "Millwall",
      "match_hometeam_score": "0",
      "match_awayteam_name": "Stoke",
      "match_awayteam_id": "2624",
      "match_awayteam_score": "0",
      "match_hometeam_halftime_score": "0",
      "match_awayteam_halftime_score": "0",
      "match_hometeam_extra_score": "",
      "match_awayteam_extra_score": "",
      "match_hometeam_penalty_score": "",
      "match_awayteam_penalty_score": "",
      "match_hometeam_ft_score": "",
      "match_awayteam_ft_score": "",
      "match_hometeam_system": "4 - 1 - 4 - 1",
      "match_awayteam_system": "3 - 4 - 3",
      "match_live": "0",
      "match_round": "Round 45",
      "match_stadium": "",
      "match_referee": "",
      "team_home_badge": "https://apiv2.apifootball.com/badges/2638_millwall.png",
      "team_away_badge": "https://apiv2.apifootball.com/badges/2624_stoke-city.png",
      "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png",
      "goalscorer": [],
      "cards": [
                    {
                      "time": "74",
                      "home_fault": "",
                      "card": "yellow card",
                      "away_fault": "Shawcross R.",
                      "info": ""
                    }.with_indifferent_access
                  ],
      "substitutions": {
        "home": [
                  {
                    "time": "66",
                    "substitution": "Marshall B. | Morison S."
                  }.with_indifferent_access
                ],
        "away": [
                  {
                    "time": "76",
                    "substitution": "Ince T. | Vokes S."
                  }.with_indifferent_access
                ]
      }.with_indifferent_access,
      "lineup": {
        "home": {
          "starting_lineups": [
                                {
                                  "lineup_player": "Cooper J.",
                                  "lineup_number": "5",
                                  "lineup_position": "4",
                                  "player_key": "183782679"
                                }.with_indifferent_access
                              ],
          "coach": [
                                {
                                  "lineup_player": "Jones N.",
                                  "lineup_number": "-1",
                                  "lineup_position": "",
                                  "player_key": "2874574677"
                                }.with_indifferent_access
                              ],
          "missing_players": []
        }.with_indifferent_access
      }.with_indifferent_access,
      "statistics": [
                    {
                      "type": "Ball Possession",
                      "home": "37%",
                      "away": "63%"
                    }.with_indifferent_access
                  ]
    }.with_indifferent_access
  ]
end