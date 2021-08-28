# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Standings < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:by_competition_and_team_and_season]
        end

        def path
          :standings
        end
      end
    end
  end
end