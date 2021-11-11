# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Competitions < Sports::Butler::SoccerApi::Competitions

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_leagues
          end
        end
      end
    end
  end
end
