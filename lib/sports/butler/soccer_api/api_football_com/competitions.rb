# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Competitions < Sports::Butler::SoccerApi::Competitions
          def path
            :leagues
          end
        end
      end
    end
  end
end
