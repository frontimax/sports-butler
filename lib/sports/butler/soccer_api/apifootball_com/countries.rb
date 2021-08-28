# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Countries < Sports::Butler::SoccerApi::Countries

          def available_endpoint_methods
            [:all]
          end

          def path
            :get_countries
          end

          def build_path(action)
            "action=#{action}"
          end

        end
      end
    end
  end
end
