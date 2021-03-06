# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module FootballDataOrg
        class Standings < Sports::Butler::SoccerApi::Standings
          def by_competition(competition_id:, filters: {})
            api.get(path: "competitions/#{competition_id}/#{path}", filters: filters)
            api
          end
        end
      end
    end
  end
end
