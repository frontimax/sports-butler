# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Countries < Sports::Butler::SoccerApi::Countries

          def available_endpoint_methods
            [:all, :by_name, :by_id]
          end

          def path
            :areas
          end

          def by_id(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            api
          end

          def by_name(name:, _filters: {})
            countries = all

            return countries if countries.response_processed.is_a?(Hash) &&
              countries.response_processed.with_indifferent_access.dig('message')
            country  = countries.response_processed['areas'].detect { |area| area['name'] == name }
            return not_found_result(name) unless country

            by_id(id: country['id'])
          end

        end
      end
    end
  end
end
