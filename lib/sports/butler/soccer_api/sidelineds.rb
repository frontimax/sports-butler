# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Sidelineds < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_player, :by_coach]
        end

        def path
          :sidelined
        end
      end
    end
  end
end