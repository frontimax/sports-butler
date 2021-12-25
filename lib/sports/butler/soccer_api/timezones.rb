# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Timezones < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:all]
        end

        def path
          :timezones
        end
      end
    end
  end
end