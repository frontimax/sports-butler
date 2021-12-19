# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Odds < Sports::Butler::SoccerApi::Odds
          def path
            :get_odds
          end

          def build_path(action)
            "action=#{action}"
          end

          def by_match(id:, from:, to:, filters: {})
            filters.merge!({ match_id: id, from: from, to: to })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
