# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Matches < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id]
        end

        def path
          :matches
        end
      end
    end
  end
end