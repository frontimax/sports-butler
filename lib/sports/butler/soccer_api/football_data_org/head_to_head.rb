# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class HeadToHead < Sports::Butler::SoccerApi::HeadToHead

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            match = api.response.parsed_response

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:head2head)
              match['head2head']
            else
              match
            end
          end

        end
      end
    end
  end
end
