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

          def filters_by_competition(id)
            { league_id: id }
          end
        end
      end
    end
  end
end
