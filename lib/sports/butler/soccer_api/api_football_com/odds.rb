# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class Odds < Sports::Butler::SoccerApi::Odds
          def path
            :odds
          end

          def by_match(id:, filters: {})
            filters.merge!({ fixture: id })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
