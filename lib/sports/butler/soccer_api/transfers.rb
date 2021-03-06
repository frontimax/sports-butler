# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Transfers < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_player, :by_team]
        end

        def path
          :transfers
        end
      end
    end
  end
end