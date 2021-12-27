# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Competitions < Sports::Butler::SoccerApi::Competitions
          def available_endpoint_methods
            [:all, :by_id, :search_by_name, :by_country_name, :seasons, :leagues, :cups]
          end

          def path
            :leagues
          end

          def seasons(filters: {})
            api.get(path: "#{path}/seasons", filters: filters)
            api
          end

          def leagues(filters: {})
            filters.merge!({ type: 'league' })
            api.get(path: build_path(path), filters: filters)
            api
          end

          def cups(filters: {})
            filters.merge!({ type: 'cup' })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
