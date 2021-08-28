# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Trophies do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :trophies }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_trophies_api_football_com
  end

  describe 'when #by_player' do
    it_behaves_like 'when #by_player', 1540,
                    :response_trophies_one_api_football_com
  end

  describe 'when #by_coach' do
    it_behaves_like 'when #by_coach', 2210,
                    :response_trophies_one_api_football_com
  end

end

def stubs_trophies_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/trophies?player=1540")
    .to_return(status: 200, body: get_mocked_response('trophies.json', sport, api_name))

  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/trophies?coach=2210")
    .to_return(status: 200, body: get_mocked_response('trophies.json', sport, api_name))
end

def response_trophies_one_api_football_com
  [
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2018/2019",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2016/2017",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2016/2017",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2015/2016",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2014/2015",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2013/2014",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Super Cup",
      "country": "Azerbaijan",
      "season": "2013/2014",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2012/2013",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2012/2013",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2010/2011",
      "place": "Winner"
    }.with_indifferent_access
  ]
end
