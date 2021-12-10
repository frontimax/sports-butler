shared_examples 'when #all' do |sport, api_name, endpoint, parsed_response, compare, mode = :response|
  it "returns all" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    endpoint  = butler.send(endpoint).all

    match = eval(compare.to_s)

    expect(endpoint).to be_a(Sports::Butler::Api)
    expect(endpoint.response).to be_a(HTTParty::Response)
    expect(endpoint.response.parsed_response).to be_a(parsed_response)

    case mode
    when :parsed_response
      expect(endpoint.response.parsed_response).to match_array(match)
    when :response
      expect(endpoint.response.parsed_response['response']).to match_array(match)
    else
      expect(endpoint.response.parsed_response[mode.to_s]).to match_array(match[mode])
    end
  end
end

shared_examples 'when #by_name' do |sport, api_name, endpoint, name, parsed_response, compare, mode = :response|
  it "returns #{name}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    endpoint  = butler.send(endpoint).by_name(name: name)

    match = eval(compare.to_s)
    expect(endpoint).to be_a(Sports::Butler::Api)
    expect(endpoint.response).to be_a(HTTParty::Response)
    expect(endpoint.response.parsed_response).to be_a(parsed_response)

    case mode
    when :parsed_response
      expect(endpoint.response.parsed_response).to match_array(match)
    when :response
      expect(endpoint.response.parsed_response['response']).to match_array(match)
    when :stringify_keys
      expect(endpoint.response.parsed_response).to include(match.stringify_keys)
    end
  end
end