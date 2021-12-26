shared_examples 'when error_missing_endpoint' do |meth, query|
  it "returns all" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result    = butler.send(endpoint).send(meth, query)

    expect(result).to be_a(String)
    expect(result).to eq("The method '#{meth}' is not available for endpoint '#{described_class.name.demodulize}' in API #{api_name}.")
  end
end

shared_examples 'when error_missing_resource' do |meth, query|
  it 'returns odd' do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result    = butler.send(endpoint).send(meth, query)

    expect(result).to be_a(Hash)
    expect(result['message']).to eq("The resource you are looking for does not exist.")
  end
end
