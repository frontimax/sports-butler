RSpec.describe Sports::Butler do

  describe 'correct release version' do
    it "has a version number" do
      expect(Sports::Butler::VERSION).not_to be nil
    end

    it "returns current version #{Sports::Butler::VERSION}" do
      expect(Sports::Butler::VERSION).to eq('1.0.0')
    end
  end
end
