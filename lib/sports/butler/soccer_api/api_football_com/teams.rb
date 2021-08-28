# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Teams < Sports::Butler::SoccerApi::Teams
          def available_endpoint_methods
            [:by_id, :by_name]
          end

          def path
            :teams
          end
        end
      end
    end
  end
end
