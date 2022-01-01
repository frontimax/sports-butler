shared_examples 'when error_missing_endpoint' do |meth, query = nil|
  it "returns all" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    if query
      result = butler.send(endpoint).send(meth, query)
    else
      result = butler.send(endpoint).send(meth)
    end


    expect(result).to be_a(String)
    expect(result).to eq("The method '#{meth}' is not available for endpoint '#{described_class.name.demodulize}' in API #{api_name}.")
  end
end

shared_examples 'when error_missing_resource' do |meth, query, mode = :default|
  it 'returns odd' do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result    = butler.send(endpoint).send(meth, query)

    case mode
    when :response_processed
      expect(result).to be_a(Sports::Butler::Api)
      expect(result.response_processed['message']).to eq("The resource you are looking for does not exist.")
    when :hash
      expect(result).to be_a(Hash)
      expect(result['message']).to eq("The resource you are looking for does not exist.")
    end

  end
end
