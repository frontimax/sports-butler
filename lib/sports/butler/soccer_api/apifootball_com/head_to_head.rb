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

          def filters_by_teams(team_id, second_team_id)
            { firstTeamId: team_id, secondTeamId: second_team_id }
          end
        end
      end
    end
  end
end
