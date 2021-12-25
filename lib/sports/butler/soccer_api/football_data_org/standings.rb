# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Standings < Sports::Butler::SoccerApi::Standings
          def by_competition(id:, filters: {})
            api.get(path: "competitions/#{id}/#{path}", filters: filters)
            api
          end
        end
      end
    end
  end
end
