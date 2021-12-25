# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Standings < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_competition]
        end

        def path
          :standings
        end
      end
    end
  end
end