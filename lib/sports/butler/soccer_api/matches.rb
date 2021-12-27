# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Matches < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [
            :by_id, :by_competition_and_year, :all, :by_team, :by_competition, :by_team_and_status,
            :by_team_finished, :by_team_scheduled
          ]
        end

        def path
          :matches
        end
      end
    end
  end
end