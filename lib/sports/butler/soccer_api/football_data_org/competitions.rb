# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Competitions < Sports::Butler::SoccerApi::Competitions
          def available_endpoint_methods
            [:all]
          end
        end
      end
    end
  end
end
