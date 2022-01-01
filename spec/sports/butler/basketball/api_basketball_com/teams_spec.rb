# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Teams do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :teams }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_teams_api_basketball_com
  end

  describe 'when #all' do
    it_behaves_like 'when error_missing_endpoint', :all
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 39, :response_teams_one_api_basketball_com
  end

  describe 'when #by_name' do
    it_behaves_like 'when #by_name', 'Nunawading', :response_teams_one_api_basketball_com
  end

  describe 'when #by_competition' do
    it_behaves_like 'when #by_competition', 1, :response_teams_all_api_basketball_com
  end

  describe 'when #by_season' do
    it_behaves_like 'when #by_season', 2020, :response_teams_all_api_basketball_com
  end

  describe 'when #search_by_name' do
    it_behaves_like 'when #search_by_name', 'Nunaw', :response_teams_all_api_basketball_com
  end

end

def stubs_teams_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams")
    .to_return(status: 200, body: get_mocked_response('teams.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams?id=39")
    .to_return(status: 200, body: get_mocked_response('team.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams?name=Nunawading")
    .to_return(status: 200, body: get_mocked_response('team.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams?league=1")
    .to_return(status: 200, body: get_mocked_response('teams.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams?season=2020")
    .to_return(status: 200, body: get_mocked_response('teams.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/teams?search=Nunaw")
    .to_return(status: 200, body: get_mocked_response('teams.json', sport, api_name))
end

def response_teams_all_api_basketball_com
  [
    {
      "id": 39,
      "name": "Nunawading",
      "logo": "https://media.api-sports.io/basketball/teams/39.png",
      "nationnal": false,
      "country": {
              "id": 1,
              "name": "Australia",
              "code": "AU",
              "flag": "https://media.api-sports.io/flags/au.svg"
            }.with_indifferent_access
    }.with_indifferent_access,
    {
      "id": 58,
      "name": "Nunawading W",
      "logo": "https://media.api-sports.io/basketball/teams/58.png",
      "nationnal": false,
      "country": {
        "id": 1,
        "name": "Australia",
        "code": "AU",
        "flag": "https://media.api-sports.io/flags/au.svg"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end

def response_teams_one_api_basketball_com
  [
    {
      "id": 39,
      "name": "Nunawading",
      "logo": "https://media.api-sports.io/basketball/teams/39.png",
      "nationnal": false,
      "country": {
              "id": 1,
              "name": "Australia",
              "code": "AU",
              "flag": "https://media.api-sports.io/flags/au.svg"
            }.with_indifferent_access
    }.with_indifferent_access
  ]
end
