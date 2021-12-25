# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Injuries < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_competition_and_season, :by_match, :by_team_and_season]
        end

        def path
          :injuries
        end
      end
    end
  end
end