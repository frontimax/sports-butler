# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Competitions < Sports::Butler::SoccerApi::Competitions

          def path
            :get_leagues
          end
        end
      end
    end
  end
end
