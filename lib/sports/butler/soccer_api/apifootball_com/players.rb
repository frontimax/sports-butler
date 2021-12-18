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

          def by_id(id:, filters: {})
            filters.merge!({ player_id: id })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
