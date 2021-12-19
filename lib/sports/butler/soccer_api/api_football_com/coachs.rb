# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Coachs < Sports::Butler::SoccerApi::Coachs
          def path
            :coachs
          end

          def by_team(team:, filters: {})
            filters.merge!({ team: team })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
