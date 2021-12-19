# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Matches < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id]
          # all  by_competition_and_year by_competition_and_match_day  by_team
          # by_team_and_status by_team_finished by_team_scheduled by_player
        end

        def path
          :matches
        end
      end
    end
  end
end