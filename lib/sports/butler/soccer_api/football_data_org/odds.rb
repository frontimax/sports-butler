# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Odds < Sports::Butler::SoccerApi::Odds
          def available_endpoint_methods
            [:by_match]
          end

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            response = api.response.parsed_response

            if response.is_a?(Hash) && response.with_indifferent_access.dig(:match) &&
              response['match'].with_indifferent_access.dig(:odds)
              response['match']['odds']
            else
              response
            end
          end

        end
      end
    end
  end
end
