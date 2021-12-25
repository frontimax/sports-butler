# frozen_string_literal: true
require 'sports/butler/basketball_api/base'

module Sports
  module Butler
    module BasketballApi
      class Countries < Sports::Butler::BasketballApi::Base
        # def available_endpoint_methods
        #   [:all, :by_name]
        # end

        def path
          :countries
        end
      end
    end
  end
end