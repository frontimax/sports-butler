# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Matches < Sports::Butler::SoccerApi::Matches

          def by_id(id:, filters: {})
            api.get(path: "#{path}/#{id}", filters: filters)
            api
          end
        end
      end
    end
  end
end
