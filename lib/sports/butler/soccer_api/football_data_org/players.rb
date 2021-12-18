# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Players < Sports::Butler::SoccerApi::Players
          def available_endpoint_methods
            [:by_id]
          end

          def by_id(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            api
          end

        end
      end
    end
  end
end
