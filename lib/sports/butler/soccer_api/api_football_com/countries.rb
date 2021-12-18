# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Countries < Sports::Butler::SoccerApi::Countries

          def available_endpoint_methods
            [:all, :by_name, :search_by_name]
          end

        end
      end
    end
  end
end
