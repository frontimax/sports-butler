# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class HeadToHead < Sports::Butler::SoccerApi::HeadToHead
          def available_endpoint_methods
            [:by_teams]
          end

          def path
            :get_H2H
          end

          def build_path(action)
            "action=#{action}"
          end

          def by_teams(team_id:, second_team_id:, filters: {})
            filters.merge!({ firstTeamId: team_id, second_team_id: second_team_id })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
