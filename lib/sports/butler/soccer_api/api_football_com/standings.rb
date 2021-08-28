# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Standings < Sports::Butler::SoccerApi::Standings
          def path
            :standings
          end
        end
      end
    end
  end
end
