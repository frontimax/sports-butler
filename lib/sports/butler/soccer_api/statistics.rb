# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Statistics < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_match]
        end

        def path
          :statistics
        end
      end
    end
  end
end