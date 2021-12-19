shared_examples 'when endpoint method' do |compare:, meth:, params: nil, mode: :response,
  result_compare: Sports::Butler::Api|

  it "returns #{meth}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)

    if params.present?
      result  = butler.send(endpoint).send(meth, params)
    else
      result  = butler.send(endpoint).send(meth)
    end

    # TODO: remove debuggers!
    # debugger

    match = eval(compare.to_s)

    expect(result).to be_a(result_compare)

    if result_compare == Sports::Butler::Api
      # debugger

      expect(result.response).to be_a(HTTParty::Response)
      expect(result.response.parsed_response).to be_a(response_type)

      # debugger

      case mode
      when :parsed_response
        expect(result.response.parsed_response).to match_array(match)
      when :response
        expect(result.response.parsed_response['response']).to match_array(match)
      when :stringify_keys
        expect(result.response.parsed_response).to include(match.stringify_keys)
      else
        expect(result.response.parsed_response[mode.to_s]).to match_array(match[mode])
      end
    else
      # Hash
      expect(result).to include(match.stringify_keys)
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
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition, params: { id: id },
                  mode: mode
end

shared_examples 'when #search_by_name' do |name, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :search_by_name, params: { name: name },
                  mode: mode
end

shared_examples 'when #by_id_and_season' do |id, season, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_id_and_season,
                  params: { id: id, season: season }, mode: mode
end

shared_examples 'when #by_match' do |id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_match, params: { id: id },
                  mode: mode, result_compare: Hash
end

shared_examples 'when #by_match_array' do |id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_match, params: { id: id },
                  mode: mode
end

shared_examples 'when #by_match_from_to' do |id, from, to, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_match, params: { id: id, from: from, to: to },
                  mode: mode
end

shared_examples 'when #by_teams' do |team_id, second_team_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_teams,
                  params: { team_id: team_id, second_team_id: second_team_id },
                  mode: mode
end

shared_examples 'when #by_teams_hash' do |team_id, second_team_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_teams,
                  params: { team_id: team_id, second_team_id: second_team_id },
                  mode: mode
end

shared_examples 'when #by_competition_and_year' do |id, year, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition_and_year,
                  params: { id: id, year: year }, mode: mode
end




