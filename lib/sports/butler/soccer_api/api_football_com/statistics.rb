# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Statistics < Sports::Butler::SoccerApi::Statistics
          def path
            'fixtures/statistics'
          end

          def filters_by_match(id)
            { fixture: id }
          end
        end
      end
    end
  end
end
