# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Seasons do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :seasons }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_seasons_api_basketball_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_seasons_all_api_basketball_com
  end
end

def stubs_seasons_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/seasons")
    .to_return(status: 200, body: get_mocked_response('seasons.json', sport, api_name))
end

def response_seasons_all_api_basketball_com
  [
    2010,
    "2010-2011",
    "2011-2012",
    2012,
    "2012-2013",
    2013,
    "2013-2014",
    2014,
    "2014-2015",
    2015,
    "2015-2016",
    2016,
    "2016-2017",
    2017,
    "2017-2018",
    2018,
    "2018-2019",
    2019,
    "2019-2020",
    2020,
    "2020-2021",
    2021,
    "2021-2022",
    2021,
    2022
  ]
end
