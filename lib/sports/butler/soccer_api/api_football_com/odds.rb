# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Odds < Sports::Butler::SoccerApi::Odds
          def path
            :odds
          end

          def filters_by_match(id)
           { fixture: id }
          end
        end
      end
    end
  end
end
