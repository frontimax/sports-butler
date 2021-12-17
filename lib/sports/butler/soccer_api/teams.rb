# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Teams < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id]
        end

        def path
          :teams
        end
      end
    end
  end
end