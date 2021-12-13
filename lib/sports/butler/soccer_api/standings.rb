# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Standings < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_competition]
        end

        def path
          :standings
        end
      end
    end
  end
end