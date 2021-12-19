# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Lineups < Sports::Butler::SoccerApi::Lineups
          def path
            :get_lineups
          end

          def build_path(action)
            "action=#{action}"
          end
        end
      end
    end
  end
end
