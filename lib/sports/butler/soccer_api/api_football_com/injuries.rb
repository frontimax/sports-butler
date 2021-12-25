# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Injuries < Sports::Butler::SoccerApi::Injuries
          def by_competition_and_season(competition_id:, season:, filters: {})
            filters.merge!({ league: competition_id, season: season })
            api.get(path: build_path(path), filters: filters)
            api
          end

          def by_team_and_season(team_id:, season:, filters: {})
            filters.merge!({ team: team_id, season: season })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
