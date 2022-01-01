# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Standings do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :standings }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_standings_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when error_missing_endpoint', :all
  end

  describe 'when #by_competition_and_team_and_season' do
    it_behaves_like 'when #by_competition_and_team_and_season', 1, 1, 2020, :response_standings_all_api_basketball_com
  end

end

def stubs_standings_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/standings?season=2020&league=1&team=1")
    .to_return(status: 200, body: get_mocked_response('standings.json', sport, api_name))
end

def response_standings_all_api_basketball_com
  [
    [
      {
        "position": 1,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 164,
                      "name": "Connecticut Sun W",
                      "logo": "https://media.api-sports.io/basketball/teams/164.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 26,
                                  "percentage": "0.813"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 6,
                                  "percentage": "0.187"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2551,
                      "against": 2237
                    }.with_indifferent_access,
        "form": "WWWWW",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 2,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 163,
                      "name": "Chicago Sky W",
                      "logo": "https://media.api-sports.io/basketball/teams/163.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 16,
                                  "percentage": "0.500"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 16,
                                  "percentage": "0.500"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2664,
                      "against": 2622
                    }.with_indifferent_access,
        "form": "WLLWL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 3,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 175,
                      "name": "Washington Mystics W",
                      "logo": "https://media.api-sports.io/basketball/teams/175.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 12,
                                  "percentage": "0.375"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 20,
                                  "percentage": "0.625"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2553,
                      "against": 2676
                    }.with_indifferent_access,
        "form": "LLWWL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 4,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 170,
                      "name": "New York Liberty W",
                      "logo": "https://media.api-sports.io/basketball/teams/170.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 12,
                                  "percentage": "0.375"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 20,
                                  "percentage": "0.625"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2511,
                      "against": 2736
                    }.with_indifferent_access,
        "form": "WLLLL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 5,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 162,
                      "name": "Atlanta Dream W",
                      "logo": "https://media.api-sports.io/basketball/teams/162.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 8,
                                  "percentage": "0.250"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 24,
                                  "percentage": "0.750"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2518,
                      "against": 2698
                    }.with_indifferent_access,
        "form": "LLWLL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 6,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Eastern Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 166,
                      "name": "Indiana Fever W",
                      "logo": "https://media.api-sports.io/basketball/teams/166.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 6,
                                  "percentage": "0.188"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 26,
                                  "percentage": "0.812"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2410,
                      "against": 2724
                    }.with_indifferent_access,
        "form": "LLLLL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 1,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 167,
                      "name": "Las Vegas Aces W",
                      "logo": "https://media.api-sports.io/basketball/teams/167.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 24,
                                  "percentage": "0.750"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 8,
                                  "percentage": "0.250"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2856,
                      "against": 2566
                    }.with_indifferent_access,
        "form": "WWWWL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 2,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 169,
                      "name": "Minnesota Lynx W",
                      "logo": "https://media.api-sports.io/basketball/teams/169.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 22,
                                  "percentage": "0.688"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 10,
                                  "percentage": "0.312"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2647,
                      "against": 2519
                    }.with_indifferent_access,
        "form": "WWWWL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 3,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 172,
                      "name": "Seattle Storm W",
                      "logo": "https://media.api-sports.io/basketball/teams/172.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 21,
                                  "percentage": "0.656"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 11,
                                  "percentage": "0.344"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2714,
                      "against": 2572
                    }.with_indifferent_access,
        "form": "WLWWL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 4,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 171,
                      "name": "Phoenix Mercury W",
                      "logo": "https://media.api-sports.io/basketball/teams/171.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 19,
                                  "percentage": "0.594"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 13,
                                  "percentage": "0.406"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2626,
                      "against": 2544
                    }.with_indifferent_access,
        "form": "LLLWW",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 5,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 165,
                      "name": "Dallas Wings W",
                      "logo": "https://media.api-sports.io/basketball/teams/165.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 14,
                                  "percentage": "0.438"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 18,
                                  "percentage": "0.562"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2596,
                      "against": 2613
                    }.with_indifferent_access,
        "form": "WLWLL",
        "description": ""
      }.with_indifferent_access,
      {
        "position": 6,
        "stage": "WNBA - Regular Season",
        "group": {
                      "name": "Western Conference",
                      "points": ""
                    }.with_indifferent_access,
        "team": {
                      "id": 168,
                      "name": "Los Angeles Sparks W",
                      "logo": "https://media.api-sports.io/basketball/teams/168.png"
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
        "games": {
                      "played": 32,
                      "win": {
                                  "total": 12,
                                  "percentage": "0.375"
                                }.with_indifferent_access,
                      "lose": {
                                  "total": 20,
                                  "percentage": "0.625"
                                }.with_indifferent_access
                    }.with_indifferent_access,
        "points": {
                      "for": 2328,
                      "against": 2467
                    }.with_indifferent_access,
        "form": "LWWLL",
        "description": ""
      }.with_indifferent_access
    ]
  ]
end
