# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class HeadToHead < Sports::Butler::SoccerApi::HeadToHead
          def available_endpoint_methods
            [:by_teams]
          end

          def path
            'fixtures/headtohead'
          end
        end
      end
    end
  end
end
