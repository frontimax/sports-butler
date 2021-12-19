# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Scorers < Sports::Butler::SoccerApi::Scorers
          def available_endpoint_methods
            [:by_competition]
          end

          def path
            :get_topscorers
          end

          def build_path(action)
            "action=#{action}"
          end
        end
      end
    end
  end
end
