# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Lineups < Sports::Butler::SoccerApi::Lineups

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            response = api.response.parsed_response

            if response.is_a?(Hash) && response.with_indifferent_access.dig(:match) &&
              response['match'].with_indifferent_access.dig(:homeTeam) &&
              response['match'].with_indifferent_access.dig(:awayTeam)

              lineups = {}
              lineups['homeTeam'] = response['match']['homeTeam']
              lineups['awayTeam'] = response['match']['awayTeam']

              api.parsed_response = lineups
            else
              api.parsed_response = response
            end

            api
          end
        end
      end
    end
  end
end
