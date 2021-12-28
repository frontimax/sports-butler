RSpec.describe Sports::Butler do
  before do
    Sports::Butler::Configuration.configure do |config|
      config.api_token = { soccer: {}, basketball: {} }
      config.api_token[:soccer][:api_football_com]  = 'my_dummy_token'

      config.api_endpoint = { soccer: {}, basketball: {} }
      config.api_endpoint[:soccer][:api_football_com]  = 'https://v3.football.api-sports.io'
    end

    stubs_butler
  end

  let(:api) { Sports::Butler::Api.new(:soccer, :api_football_com) }

  describe 'correct release version' do
    it "has a version number" do
      expect(Sports::Butler::VERSION).not_to be nil
    end

    it "returns current version #{Sports::Butler::VERSION}" do
      expect(Sports::Butler::VERSION).to eq('1.0.0')
    end
  end

  describe 'when build new sports butler object' do
    it 'builds soccer object with success' do
      butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)

      expect(butler).to be_a(Sports::Butler::Soccer)
    end

    it 'fails with error' do
      butler = described_class.new(sport: :women_mud_wrestling, api_name: :api_football_com)
      expect(butler)
        .to eq('Invalid sport / api parameter. Available sports: soccer, basketball. Available apis: football_data_org, apifootball_com, api_football_com, api_basketball_com')
    end
  end

  describe 'when class method #get' do
    it 'returns result' do
      url = "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?name=Albania"
      butler = described_class.get(url: url)

      expect(butler).to be_a(HTTParty::Response)
      expect(butler.parsed_response).to be_a(Hash)
      expect(butler.parsed_response['response']).to be_a(Array)
      expect(butler.parsed_response['response'].first['name']).to eq('Albania')
    end
  end

  describe 'when unsupported endpoint klass' do
    it 'returns error' do
      butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)

      expect(butler).to be_a(Sports::Butler::Soccer)
      expect { butler.bazinga }.to raise_error { |error|
        expect(error.message)
          .to eq("NOT AVAILABLE: the endpoint 'bazinga' is not available for this sport/api combination.")
      }
    end
  end

  describe 'when show_endpoints' do
    it "has a version number" do
      expect(Sports::Butler::show_endpoints).to be_truthy
    end
  end

  describe 'when default_api_hash' do
    it 'returns default hash' do
      expect(Sports::Butler::Configuration.default_api_hash).to eq({ soccer: {}, basketball: {} })
    end
  end

  describe 'when invalid_config_result ' do
    before do
      Sports::Butler::Configuration.configure do |config|
        config.api_token = { soccer: {}, basketball: {} }

        config.api_endpoint = { soccer: {}, basketball: {} }
        config.api_endpoint[:soccer][:api_football_com]  = 'https://v3.football.api-sports.io'
      end

      stubs_butler
    end

    it 'returns invalid_config_result message hash' do
      butler = Sports::Butler.new(sport: :soccer, api_name: :api_football_com)

      expect(butler).to be_a(Sports::Butler::Soccer)
      
      butler.countries.by_name(name: 'Albania')
      expect(butler.countries.api.success).to be_falsey
      expect(butler.countries.api.response[:message]).to eq('Invalid Configuration, check empty api_token or empty / invalid api_endpoint!')
    end
  end
end

def stubs_butler
  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?phone=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', :soccer, :api_football_com))

  stub_request(:get, "#{Sports::Butler::Configuration.api_endpoint[:soccer][:api_football_com]}/countries?name=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', :soccer, :api_football_com))
end
