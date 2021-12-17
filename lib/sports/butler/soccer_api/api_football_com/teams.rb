# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Teams < Sports::Butler::SoccerApi::Teams
          def path
            :teams
          end
        end
      end
    end
  end
end
