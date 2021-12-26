# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Players < Sports::Butler::SoccerApi::Players
          def available_endpoint_methods
            [:by_id]
          end

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_players
          end

          def filters_by_id(id)
            { player_id: id }
          end
        end
      end
    end
  end
end
