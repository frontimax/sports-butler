# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Seasons < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:all]
        end

        def path
          :seasons
        end
      end
    end
  end
end