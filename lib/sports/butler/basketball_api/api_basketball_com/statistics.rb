# frozen_string_literal: true

module Sports
  module Butler
    module BasketballApi
      module ApiBasketballCom
        class Statistics < Sports::Butler::BasketballApi::Statistics

          def filters_by_competition_and_team_and_season(competition_id, team_id, season)
            { league: competition_id, team: team_id, season: season }
          end
        end
      end
    end
  end
end
