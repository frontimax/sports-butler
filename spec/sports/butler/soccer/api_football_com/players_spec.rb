# frozen_string_literal: true

RSpec.describe Sports::Butler::SoccerApi::ApiFootballCom::Players do
  let(:sport)     { :soccer }
  let(:api_name)  { :api_football_com }
  let(:endpoint)  { :players }
  let(:response_type)  { Hash }

  before do
    ConfigHelpers.set_api_football_com
    stubs_players_api_football_com
  end

  describe 'when #by_id' do
    it_behaves_like 'when error_missing_endpoint', :by_id, { id: 1 }
  end

  describe 'when #by_id_and_season' do
    it_behaves_like 'when #by_id_and_season', 4068429598, '2019',
                    :response_players_one_api_football_com
  end
end

def stubs_players_api_football_com
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[sport][api_name]}/players?id=4068429598&season=2019")
    .to_return(status: 200, body: get_mocked_response('players.json', sport, api_name))
end

def response_players_one_api_football_com
  [
    {
      "player": {
        "id": 7190,
        "name": "Alan Lima Cariús",
        "firstname": "Alan",
        "lastname": "Lima Cariús",
        "age": 24,
        "birth": {
          "date": "1997-04-04",
          "place": "Petrópolis",
          "country": "Brazil"
        }.with_indifferent_access,
        "nationality": "Brazil",
        "height": "175 cm",
        "weight": "74 kg",
        "injured": false,
        "photo": "https://media.api-sports.io/football/players/7190.png"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
