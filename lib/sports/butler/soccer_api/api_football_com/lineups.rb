# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Lineups < Sports::Butler::SoccerApi::Lineups
          def path
            'fixtures/lineups'
          end

          def filters_by_match(id)
            { fixture: id }
          end
        end
      end
    end
  end
end
