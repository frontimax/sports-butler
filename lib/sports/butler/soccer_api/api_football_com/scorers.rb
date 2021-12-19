# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Scorers < Sports::Butler::SoccerApi::Scorers
          def available_endpoint_methods
            [:by_competition_and_year]
          end

          def path
            'players/topscorers'
          end

          def by_competition_and_year(id:, year:, filters: {})
            filters.merge!({ league: id, season: year })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
