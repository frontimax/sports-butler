# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Coachs < Sports::Butler::SoccerApi::Coachs
          def path
            :coachs
          end
        end
      end
    end
  end
end
