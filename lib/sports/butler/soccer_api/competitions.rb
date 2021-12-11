# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Competitions < Sports::Butler::SoccerApi::Base
        def available_endpoints
          [:all, :by_name]
        end

        def path
          :competitions
        end
      end
    end
  end
end