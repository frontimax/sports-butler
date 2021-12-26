# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::Odds do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :odds }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_odds_football_data_org
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match', 78,
                    :response_odds_one_football_data_org, :stringify_keys
  end

  describe 'when #by_match_and_range' do
    it_behaves_like 'when error_missing_endpoint', :by_match_and_range, { id: 1, from: '2020-01-01', to: '2020-01-01' }
  end

  describe 'error message' do
    it_behaves_like 'when error_missing_resource', :by_match, { id: 99 }
  end
end

def stubs_odds_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches/78")
    .to_return(status: 200, body: get_mocked_response('odds.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches/99")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', sport, api_name))
end

def response_odds_one_football_data_org
  {
    "msg": "Activate Odds-Package in User-Panel to retrieve odds."
  }
end
