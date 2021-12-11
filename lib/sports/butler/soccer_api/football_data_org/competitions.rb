# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Competitions < Sports::Butler::SoccerApi::Competitions
          def available_endpoints
            [:all]
          end
        end
      end
    end
  end
end
