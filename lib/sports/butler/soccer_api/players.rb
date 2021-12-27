# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Players < Sports::Butler::SoccerApi::Base
        # def available_endpoint_methods
        #   [:by_id, :by_id_and_season, :by_name]
        # end

        def path
          :players
        end
      end
    end
  end
end