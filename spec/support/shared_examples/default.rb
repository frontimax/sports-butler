shared_examples 'when endpoint method' do |compare:, meth:, params: nil, mode: :response|
  it "returns #{meth}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)

    if params.present?
      result  = butler.send(endpoint).send(meth, params)
    else
      result  = butler.send(endpoint).send(meth)
    end

    match = eval(compare.to_s)

    expect(result).to be_a(Sports::Butler::Api)
    expect(result.response).to be_a(HTTParty::Response)
    expect(result.response.parsed_response).to be_a(response_type)

    case mode
    when :parsed_response
      expect(result.respongpse.parsed_response).to match_array(match)
    when :response
      expect(result.response.parsed_response['response']).to match_array(match)
    when :stringify_keys
      expect(result.response.parsed_response).to include(match.stringify_keys)
    else
      expect(result.response.parsed_response[mode.to_s]).to match_array(match[mode])
    end
  end
end

## ----------------------->

shared_examples 'when #all' do |compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :all, mode: mode
end

shared_examples 'when #by_name' do |name, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_name, params: { name: name }, mode: mode
end

shared_examples 'when #by_id' do |id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_id, params: { id: id }, mode: mode
end

shared_examples 'when #by_competition' do |id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition, params: { competition_id: id }, mode: mode
end