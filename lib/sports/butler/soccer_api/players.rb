# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Players < Sports::Butler::SoccerApi::Base
        def path
          :players
        end
      end
    end
  end
end