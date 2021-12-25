# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::FootballDataOrg::HeadToHead do
  let(:sport)     { :soccer }
  let(:api_name)  { :football_data_org }
  let(:endpoint)  { :head_to_head }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_football_data_org
    stubs_head_to_head_football_data_org
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match', 78,
                    :response_head_to_head_one_football_data_org, :stringify_keys
  end

  describe 'when #b_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end
end

def stubs_head_to_head_football_data_org
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/matches/78")
    .to_return(status: 200, body: get_mocked_response('head_to_head.json', sport, api_name))
end

def response_head_to_head_one_football_data_org
  {
    "numberOfMatches": 5,
    "totalGoals": 26,
    "homeTeam": {
      "id": 678,
      "name": "AFC Ajax",
      "wins": 5,
      "draws": 0,
      "losses": 0
    }.with_indifferent_access,
    "awayTeam": {
      "id": 1914,
      "name": "FC Emmen",
      "wins": 0,
      "draws": 0,
      "losses": 5
    }.with_indifferent_access
  }.with_indifferent_access
end
