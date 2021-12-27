# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApifootballCom
        class Matches < Sports::Butler::SoccerApi::Matches
          def available_endpoint_methods
            [:by_id, :by_competition_and_year, :by_team, :by_competition]
          end

          def build_path(action)
            "action=#{action}"
          end

          def path
            :get_events
          end

          def by_competition_and_year(id:, year:, filters: {})
            from  = "#{year}-01-01"
            to    = "#{year}-12-31"
            filters.merge!({ league_id: id, from: from, to: to })
            api.get(path: build_path(path), filters: filters)
            api
          end

          def filters_by_id(id)
            { match_id: id }
          end

          def filters_by_competition(id)
            { league_id: id }
          end
        end
      end
    end
  end
end
