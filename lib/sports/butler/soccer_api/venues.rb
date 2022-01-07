# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Venues < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id]
        end

        def path
          :venues
        end
      end
    end
  end
end