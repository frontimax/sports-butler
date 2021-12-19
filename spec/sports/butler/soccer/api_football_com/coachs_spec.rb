# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Coachs do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :coachs }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_coachs_api_football_com
  end

  describe 'when #search_by_name' do
    it_behaves_like 'when #search_by_name', 'Rose',
                    :response_coachs_one_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 1540,
                    :response_coachs_one_api_football_com
  end

  describe 'when #by_team' do
    it_behaves_like 'when #by_team_name', 1540,
                    :response_coachs_one_api_football_com
  end
end

def stubs_coachs_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/coachs?id=1540")
    .to_return(status: 200, body: get_mocked_response('coachs.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/coachs?name=Rose")
    .to_return(status: 200, body: get_mocked_response('coachs.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/coachs?team=1540")
    .to_return(status: 200, body: get_mocked_response('coachs.json', sport, api_name))
end

def response_coachs_one_api_football_com
  [
    {
      "id": 1540,
      "name": "M. Rose",
      "firstname": "Marco",
      "lastname": "Rose",
      "age": 45,
      "birth": {
              "date": "1976-09-11",
              "place": "Leipzig",
              "country": "Germany"
            }.with_indifferent_access,
      "nationality": "Germany",
      "height": "187 cm",
      "weight": "83 kg",
      "photo": "https://media.api-sports.io/football/coachs/1540.png",
      "team": {
              "id": 165,
              "name": "Borussia Dortmund",
              "logo": "https://media.api-sports.io/football/teams/165.png"
            }.with_indifferent_access,
      "career": [
              {
                "team": {
                          "id": 165,
                          "name": "Borussia Dortmund",
                          "logo": "https://media.api-sports.io/football/teams/165.png"
                        }.with_indifferent_access,
                "start": "2021-07-01",
                "end": ""
              }.with_indifferent_access,
              {
                "team": {
                          "id": 163,
                          "name": "Borussia M'gladbach",
                          "logo": "https://media.api-sports.io/football/teams/163.png"
                        }.with_indifferent_access,
                "start": "2019-07-01",
                "end": "2021-06-01"
              }.with_indifferent_access,
              {
                "team": {
                          "id": 571,
                          "name": "Salzburg",
                          "logo": "https://media.api-sports.io/football/teams/571.png"
                        }.with_indifferent_access,
                "start": "2017-06-01",
                "end": "2019-06-01"
              }.with_indifferent_access,
              {
                "team": {
                          "id": 7928,
                          "name": "Salzburg U19",
                          "logo": "https://media.api-sports.io/football/teams/7928.png"
                        }.with_indifferent_access,
                "start": "2016-07-01",
                "end": "2017-06-01"
              }.with_indifferent_access,
              {
                "team": {
                          "id": 9355,
                          "name": "Lokomotive Leipzig",
                          "logo": "https://media.api-sports.io/football/teams/9355.png"
                        }.with_indifferent_access,
                "start": "2012-07-01",
                "end": "2013-06-01"
              }.with_indifferent_access
            ]
    }.with_indifferent_access
  ]
end
