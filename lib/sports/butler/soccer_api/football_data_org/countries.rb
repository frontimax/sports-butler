# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Countries < Sports::Butler::SoccerApi::Countries
          require 'sports/butler/soccer_api/football_data_org/base'
          include Sports::Butler::SoccerApi::FootballDataOrg::Base

          def available_endpoint_methods
            [:all, :by_name, :by_id]
          end

          def path
            :areas
          end

          def by_id(id:, filters: {})
            api_with_id(id, filters)
          end

          def by_name(name:, _filters: {})
            api = all

            return api if api.response_processed.is_a?(Hash) &&
              api.response_processed.with_indifferent_access.dig('message')

            country = api.response_processed['areas'].detect { |area| area['name'] == name }

            if country
              by_id(id: country['id'])
            else
              api.response_processed = not_found_result(name)
              api
            end

          end
        end
      end
    end
  end
end
