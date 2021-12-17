# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Teams < Sports::Butler::SoccerApi::Teams

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_teams
          end

          def by_id(id:, filters: {})
            filters.merge!({ team_id: id })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
