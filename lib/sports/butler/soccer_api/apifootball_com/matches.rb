# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Matches < Sports::Butler::SoccerApi::Matches

          def by_id(id:, filters: {})
            filters.merge!({ match_id: id })
            api.get(path: build_path(path), filters: filters)
            api
          end

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_events
          end
        end
      end
    end
  end
end
