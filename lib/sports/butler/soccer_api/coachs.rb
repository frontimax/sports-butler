# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Coachs < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id, :search_by_name, :by_team]
        end

        def path
          :coachs
        end
      end
    end
  end
end