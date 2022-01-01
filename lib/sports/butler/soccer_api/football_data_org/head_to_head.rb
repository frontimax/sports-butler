# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class HeadToHead < Sports::Butler::SoccerApi::HeadToHead
          def available_endpoint_methods
            [:by_match]
          end

          def by_match(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            response = api.response.parsed_response

            if response.is_a?(Hash) && response.with_indifferent_access.dig(:head2head)
              api.response_processed = response['head2head']
            else
              api.response_processed = response
            end

            api
          end
        end
      end
    end
  end
end
