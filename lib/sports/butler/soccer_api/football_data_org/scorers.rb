# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Scorers < Sports::Butler::SoccerApi::Scorers
          def available_endpoint_methods
            [:by_competition]
          end

          def by_competition(id:, filters: {})
            api.get(path: "competitions/#{id}/#{path}", filters: filters)
            api
          end
        end
      end
    end
  end
end
