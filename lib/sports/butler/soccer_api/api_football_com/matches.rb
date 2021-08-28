# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Matches < Sports::Butler::SoccerApi::Matches
          def available_endpoint_methods
            [:by_id, :by_competition_and_year, :all]
          end

          def path
            :fixtures
          end
        end
      end
    end
  end
end
