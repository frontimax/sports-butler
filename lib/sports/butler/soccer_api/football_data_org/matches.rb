# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Matches < Sports::Butler::SoccerApi::Matches
          require 'sports/butler/soccer_api/football_data_org/base'
          include Sports::Butler::SoccerApi::FootballDataOrg::Base

          def by_id(id:, filters: {})
            api_with_id(id, filters)
          end
        end
      end
    end
  end
end
