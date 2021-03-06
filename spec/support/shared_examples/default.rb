shared_examples 'when endpoint method' do |compare:, meth:, params: nil, mode: :response,
  result_compare: Sports::Butler::Api|

  it "returns #{meth}" do
    butler    = Sports::Butler.new(sport: sport, api_name: api_name)

    if params.present?
      result  = butler.send(endpoint).send(meth, params)
    else
      result  = butler.send(endpoint).send(meth)
    end

    match = eval(compare.to_s)
    expect(result).to be_a(result_compare)

    if result_compare == Sports::Butler::Api
      expect(result.response).to be_a(HTTParty::Response)
      expect(result.response.parsed_response).to be_a(response_type)

      case mode
      when :parsed_response
        expect(result.response.parsed_response).to match_array(match)
      when :response
          expect(result.response.parsed_response['response']).to match_array(match)
      when :stringify_keys
        expect(result.response.parsed_response).to include(match.stringify_keys)
      when :response_processed
        expect(result.parsed_response).to include(match.stringify_keys)
      else
        expect(result.response.parsed_response[mode.to_s]).to match_array(match[mode])
      end
    else
      expect(result).to include(match.stringify_keys)
    end
  end
end

## ----------------------->

shared_examples 'when #all' do |compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :all, params: { }, mode: mode
end

shared_examples 'when #by_name' do |name, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_name, params: { name: name }, mode: mode
end

shared_examples 'when #by_id' do |id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_id, params: { id: id }, mode: mode
end

shared_examples 'when #by_competition' do |competition_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare,
                  meth: :by_competition, params: { competition_id: competition_id },
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

shared_examples 'when #by_match' do |match_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_match, params: { match_id: match_id },
                  mode: mode, result_compare: Hash
end

shared_examples 'when #by_match_array' do |match_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_match, params: { match_id: match_id },
                  mode: mode
end

shared_examples 'when #by_team' do |team_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team,
                  params: { team_id: team_id },
                  mode: mode
end

shared_examples 'when #by_team_and_range' do |team_id, from, to, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team_and_range,
                  params: { team_id: team_id, from: from, to: to },
                  mode: mode
end

shared_examples 'when #by_competition_and_range' do |competition_id, from, to, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition_and_range,
                  params: { competition_id: competition_id, from: from, to: to },
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

shared_examples 'when #by_competition_and_year' do |competition_id, year, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition_and_year,
                  params: { competition_id: competition_id, year: year }, mode: mode
end

shared_examples 'when #by_competition_and_season' do |competition_id, season, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition_and_season,
                  params: { competition_id: competition_id, season: season }, mode: mode
end

shared_examples 'when #by_team_and_season' do |team_id, season, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team_and_season,
                  params: { team_id: team_id, season: season }, mode: mode
end

shared_examples 'when #by_player' do |player_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_player,
                  params: { player_id: player_id }, mode: mode
end

shared_examples 'when #by_coach' do |coach_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_coach,
                  params: { coach_id: coach_id }, mode: mode
end

shared_examples 'when #by_country_name' do |country_name, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_country_name,
                  params: { country_name: country_name }, mode: mode
end

shared_examples 'when #seasons' do |compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :seasons,
                  params: {}, mode: mode
end

shared_examples 'when #leagues' do |compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :leagues,
                  params: {}, mode: mode
end

shared_examples 'when #cups' do |compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :cups,
                  params: {}, mode: mode
end

shared_examples 'when #by_country' do |country_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_country,
                  params: { country_id: country_id },
                  mode: mode
end

shared_examples 'when #by_team_and_status' do |team_id, status, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team_and_status,
                  params: { team_id: team_id, status: status }, mode: mode
end

shared_examples 'when #by_team_finished' do |team_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team_finished,
                  params: { team_id: team_id }, mode: mode
end

shared_examples 'when #by_team_scheduled' do |team_id, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_team_scheduled,
                  params: { team_id: team_id }, mode: mode
end

shared_examples 'when #by_season' do |season, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_season,
                  params: { season: season }, mode: mode
end

shared_examples 'when #by_code' do |code, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_code,
                  params: { code: code }, mode: mode
end

shared_examples 'when #by_competition_and_team_and_season' do
|competition_id, team_id, season, compare, mode = :response|
  it_behaves_like 'when endpoint method', compare: compare, meth: :by_competition_and_team_and_season,
                  params: { competition_id: competition_id, team_id: team_id, season: season }, mode: mode
end




