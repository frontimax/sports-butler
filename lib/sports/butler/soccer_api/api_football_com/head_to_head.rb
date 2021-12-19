# frozen_string_literal: true

module Sports
  module Butler
    module SoccerApi
      module ApiFootballCom
        class HeadToHead < Sports::Butler::SoccerApi::HeadToHead
          def path
            'fixtures/headtohead'
          end

          def by_teams(team_id:, second_team_id:, filters: {})
            filters.merge!({ team_id: team_id, second_team_id: second_team_id })
            api.get(path: build_path(path), filters: filters)
            api
          end
        end
      end
    end
  end
end
