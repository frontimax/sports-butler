# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Lineups < Sports::Butler::SoccerApi::Lineups

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            match = api.response.parsed_response.dig('match')

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:homeTeam) &&
              match.with_indifferent_access.dig(:awayTeam)

              lineups = {}
              lineups['homeTeam'] = match['homeTeam']
              lineups['awayTeam'] = match['awayTeam']
              lineups
            else
              match
            end
          end
        end
      end
    end
  end
end
