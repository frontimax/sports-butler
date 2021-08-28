# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Scorers < Sports::Butler::SoccerApi::Base
        def path
          :scorers
        end
      end
    end
  end
end