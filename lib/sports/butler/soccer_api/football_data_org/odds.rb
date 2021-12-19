# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Odds < Sports::Butler::SoccerApi::Odds

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            match = api.response.parsed_response.dig('match')

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:odds)
              match['odds']
            else
              match
            end
          end

        end
      end
    end
  end
end
