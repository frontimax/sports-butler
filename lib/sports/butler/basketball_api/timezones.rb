# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Timezones < Sports::Butler::BasketballApi::Base
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