# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class HeadToHead < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_match, :by_teams]
        end

        def path
          :matches
        end
      end
    end
  end
end