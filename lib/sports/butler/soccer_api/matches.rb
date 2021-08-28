# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Matches < Sports::Butler::SoccerApi::Base
        def path
          :matches
        end
      end
    end
  end
end