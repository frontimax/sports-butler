# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Odds < Sports::Butler::SoccerApi::Odds
          def by_match(match_id:, filters: {})
            api.get(path: "#{path}/#{match_id}", filters: filters)
            response = api.response.parsed_response

            if response.is_a?(Hash) && response.with_indifferent_access.dig(:match) &&
              response['match'].with_indifferent_access.dig(:odds)
              api.parsed_response = response['match']['odds']
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
