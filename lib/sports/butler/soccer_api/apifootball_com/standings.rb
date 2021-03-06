# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Standings < Sports::Butler::SoccerApi::Standings

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_standings
          end

          def filters_by_competition(id)
            { league_id: id }
          end
        end
      end
    end
  end
end
