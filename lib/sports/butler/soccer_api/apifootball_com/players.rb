# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Players < Sports::Butler::SoccerApi::Players
          def available_endpoint_methods
            [:by_id, :by_name]
          end

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_players
          end

          def by_name(name: , filters: {})
            filters.merge!({ player_name: name })
            api.get(path: build_path(path), filters: filters)
            api
          end

          def filters_by_id(id)
            { player_id: id }
          end
        end
      end
    end
  end
end
