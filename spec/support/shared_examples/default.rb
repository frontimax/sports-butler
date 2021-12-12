shared_examples 'when #all' do |compare, mode = :response|
  it "returns all" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result    = butler.send(endpoint).all

    match = eval(compare.to_s)

    expect(result).to be_a(Sports::Butler::Api)
    expect(result.response).to be_a(HTTParty::Response)
    expect(result.response.parsed_response).to be_a(response_type)

    case mode
    when :parsed_response
      expect(result.response.parsed_response).to match_array(match)
    when :response
      expect(result.response.parsed_response['response']).to match_array(match)
    else
      expect(result.response.parsed_response[mode.to_s]).to match_array(match[mode])
    end
  end
end

shared_examples 'when #by_name' do |name, compare, mode = :response|
  it "returns #{name}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result  = butler.send(endpoint).by_name(name: name)

    match = eval(compare.to_s)
    expect(result).to be_a(Sports::Butler::Api)
    expect(result.response).to be_a(HTTParty::Response)
    expect(result.response.parsed_response).to be_a(response_type)

    case mode
    when :parsed_response
      expect(result.response.parsed_response).to match_array(match)
    when :response
      expect(result.response.parsed_response['response']).to match_array(match)
    when :stringify_keys
      expect(result.response.parsed_response).to include(match.stringify_keys)
    end
  end
end

shared_examples 'when #by_id' do |id, compare, mode = :response|
  it "returns #{name}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)
    result  = butler.send(endpoint).by_id(id: id)

    match = eval(compare.to_s)
    expect(result).to be_a(Sports::Butler::Api)
    expect(result.response).to be_a(HTTParty::Response)
    expect(result.response.parsed_response).to be_a(response_type)

    case mode
    when :parsed_response
      expect(result.response.parsed_response).to match_array(match)
    when :response
      expect(result.response.parsed_response['response']).to match_array(match)
    when :stringify_keys
      expect(result.response.parsed_response).to include(match.stringify_keys)
    end
  end
end