# frozen_string_literal: true

RSpec.describe Sports::Butler::BasketballApi::ApiBasketballCom::Timezones do
  let(:sport)     { :basketball }
  let(:api_name)  { :api_basketball_com }
  let(:endpoint)  { :timezones }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_basketball_com
    stubs_timezones_api_basketball_com
  end

  describe 'when all' do
    it_behaves_like 'when #all', :response_timezones_all_api_basketball_com
  end
end

def stubs_timezones_api_basketball_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/timezones")
    .to_return(status: 200, body: get_mocked_response('timezones.json', sport, api_name))
end

def response_timezones_all_api_basketball_com
  [
    "Africa/Abidjan",
    "Africa/Accra",
    "Africa/Addis_Ababa",
    "Africa/Algiers",
    "Africa/Asmara"
  ]
end
