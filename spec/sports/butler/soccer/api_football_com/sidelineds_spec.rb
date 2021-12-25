# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Sidelineds do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :sidelineds }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_sidelineds_api_football_com
  end

  describe 'when #by_player' do
    it_behaves_like 'when #by_player', 25333,
                    :response_sidelineds_one_api_football_com
  end

  describe 'when #by_coach' do
    it_behaves_like 'when #by_coach', 1,
                    :response_sidelineds_one_api_football_com
  end
end

def stubs_sidelineds_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/sidelined?player=25333")
    .to_return(status: 200, body: get_mocked_response('sidelineds.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/sidelined?coach=1")
    .to_return(status: 200, body: get_mocked_response('sidelineds.json', sport, api_name))
end

def response_sidelineds_one_api_football_com
  [
    {
      "type": "Knee Injury",
      "start": "2021-12-01",
      "end": ""
    }.with_indifferent_access,
    {
      "type": "Virus",
      "start": "2021-04-04",
      "end": "2021-10-01"
    }.with_indifferent_access,
    {
      "type": "Suspended",
      "start": "2019-11-25",
      "end": "2019-12-07"
    }.with_indifferent_access,
    {
      "type": "Knee Injury",
      "start": "2019-05-08",
      "end": "2019-05-31"
    }.with_indifferent_access
  ]
end
