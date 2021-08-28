# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Matches < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:by_id, :by_competition_and_year, :all]
        end

        def path
          :games
        end
      end
    end
  end
end