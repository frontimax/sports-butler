# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Competitions < Sports::Butler::SoccerApi::Base
        def path
          :competitions
        end
      end
    end
  end
end