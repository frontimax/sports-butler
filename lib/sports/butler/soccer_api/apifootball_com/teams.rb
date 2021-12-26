# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Teams < Sports::Butler::SoccerApi::Teams

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_teams
          end

          def filters_by_id(id)
            { team_id: id }
          end
        end
      end
    end
  end
end
