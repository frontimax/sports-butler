# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Teams < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id, :by_name]
        end

        def path
          :teams
        end
      end
    end
  end
end