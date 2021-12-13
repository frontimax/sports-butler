# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Matches < Sports::Butler::SoccerApi::Matches
          def path
            :fixtures
          end
        end
      end
    end
  end
end
