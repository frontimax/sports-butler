# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Odds < Sports::Butler::SoccerApi::Odds
          def available_endpoint_methods
            [:by_match_with_range]
          end

          def path
            :get_odds
          end

          def build_path(action)
            "action=#{action}"
          end

          def by_match_with_range(match_id:, from:, to:, filters: {})
            filters.merge!({ match_id: match_id, from: from, to: to })
            api.get(path: build_path(path), filters: filters)
            api
          end

        end
      end
    end
  end
end
