# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApifootballCom::Statistics do
  let(:sport)     { :soccer }
  let(:api_name)  { :apifootball_com }
  let(:endpoint)  { :statistics }
  let(:response_type)  { Array }

  before do
    ConfigHelpers.set_apifootball_com
    stubs_statistics_apifootball_com
  end

  describe 'when #by_match' do
    it_behaves_like 'when #by_match_array', 86392,
                    :response_statistics_all_apifootball_com, :parsed_response
  end
end

def stubs_statistics_apifootball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/?APIkey=my_dummy_token&action=get_statistics&match_id=86392")
    .to_return(status: 200, body: get_mocked_response('statistics.json', sport, api_name))
end

def response_statistics_all_apifootball_com
  [
    {
      "86392": {
                 "statistics": [
                                 {
                                   "type": "Shots Total",
                                   "home": "14",
                                   "away": "5"
                                 }.with_indifferent_access,
                                 {
                                   "type": "Shots On Goal",
                                   "home": "9",
                                   "away": "2"
                                 }.with_indifferent_access,
                                 {
                                   "type": "Shots Off Goal",
                                   "home": "4",
                                   "away": "2"
                                 }.with_indifferent_access
                               ]
               }.with_indifferent_access
    }.with_indifferent_access
  ]
end
