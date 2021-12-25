# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Transfers do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :transfers }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_transfers_api_football_com
  end

  describe 'when #by_player' do
    it_behaves_like 'when #by_player', 1540,
                    :response_transfers_one_api_football_com
  end

  describe 'when #by_team' do
    it_behaves_like 'when #by_team', 3569,
                    :response_transfers_one_api_football_com
  end
end

def stubs_transfers_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/transfers?player=1540")
    .to_return(status: 200, body: get_mocked_response('transfers.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/transfers?team=3569")
    .to_return(status: 200, body: get_mocked_response('transfers.json', sport, api_name))
end

def response_transfers_one_api_football_com
  [
    {
      "player": {
        "id": 1540,
        "name": "Araz Abdullayev"
      }.with_indifferent_access,
      "update": "2021-08-22T08:38:22+00:00",
      "transfers": [
                  {
                    "date": "2020-09-14",
                    "type": "Free",
                    "teams": {
                      "in": {
                        "id": 3569,
                        "name": "Boluspor",
                        "logo": "https://media.api-sports.io/football/teams/3569.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 556,
                        "name": "Qarabag",
                        "logo": "https://media.api-sports.io/football/teams/556.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2018-07-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 556,
                        "name": "Qarabag",
                        "logo": "https://media.api-sports.io/football/teams/556.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2017-08-14",
                    "type": "Loan",
                    "teams": {
                      "in": {
                        "id": 2269,
                        "name": "Anorthosis",
                        "logo": "https://media.api-sports.io/football/teams/2269.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2017-01-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 2270,
                        "name": "Neftchi Baku",
                        "logo": "https://media.api-sports.io/football/teams/2270.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2012-07-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 2270,
                        "name": "Neftchi Baku",
                        "logo": "https://media.api-sports.io/football/teams/2270.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 622,
                        "name": "Panionios",
                        "logo": "https://media.api-sports.io/football/teams/622.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end
