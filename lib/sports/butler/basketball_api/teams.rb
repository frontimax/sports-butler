# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Teams < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:by_id, :by_name, :by_competition, :by_season, :search_by_name ]
        end

        def path
          :teams
        end
      end
    end
  end
end