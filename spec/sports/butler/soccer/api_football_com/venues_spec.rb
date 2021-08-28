# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Venues do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :venues }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_venues_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when #by_id', 745,
                    :response_venues_one_api_football_com
  end
end

def stubs_venues_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_base_url[sport][api_name]}/venues?id=745")
    .to_return(status: 200, body: get_mocked_response('venue.json', sport, api_name))
end

def response_venues_one_api_football_com
  [
    {
      "id": 745,
      "name": "Millerntor-Stadion",
      "address": "Auf dem Heiligengeistfeld",
      "city": "Hamburg",
      "country": "Germany",
      "capacity": 29546,
      "surface": "grass",
      "image": "https://media.api-sports.io/football/venues/745.png"
    }.with_indifferent_access
  ]
end
