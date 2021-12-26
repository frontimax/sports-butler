# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Players < Sports::Butler::SoccerApi::Players
          require 'sports/butler/soccer_api/football_data_org/base'
          include Sports::Butler::SoccerApi::FootballDataOrg::Base

          def available_endpoint_methods
            [:by_id]
          end

          def by_id(id:, filters: {})
            api_with_id(id, filters)
          end

        end
      end
    end
  end
end
