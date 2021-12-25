# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Predictions < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_match]
        end

        def path
          :predictions
        end
      end
    end
  end
end