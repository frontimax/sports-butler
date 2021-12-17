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
end

def stubs_players_api_football_com

end
