# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Competitions do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :competitions }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_competitions_apifootball_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_competitions_all_apifootball_com, :parsed_response
  end

  describe 'when #by_name' do
    it_behaves_like 'when error_missing_endpoint', :by_name, { name: 'Bundesliga' }
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end
end

def stubs_competitions_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/?APIkey=my_dummy_token&action=get_leagues")
    .to_return(status: 200, body: get_mocked_response('competitions.json', sport, api_name))
end

def response_competitions_all_apifootball_com
  [
    {
      "country_id": "41",
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "league_season": "2021/2022",
      "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png"
    }.with_indifferent_access,
    {
      "country_id": "46",
      "country_name": "France",
      "league_id": "177",
      "league_name": "Ligue 2",
      "league_season": "2021/2022",
      "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/177_ligue-2.png",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/46_france.png"
    }.with_indifferent_access
  ]
end
