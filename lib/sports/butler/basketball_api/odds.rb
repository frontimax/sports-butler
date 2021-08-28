# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Odds < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:by_match]
        end

        def path
          :odds
        end
      end
    end
  end
end