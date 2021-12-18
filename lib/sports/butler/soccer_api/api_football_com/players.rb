# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Players < Sports::Butler::SoccerApi::Players
          def available_endpoint_methods
            [:by_id_and_season]
          end

          def path
            :players
          end

          def by_id_and_season(id:, season:, filters: {})
            filters.merge!({ id: id, season: season })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end

      end
    end
  end
end
1