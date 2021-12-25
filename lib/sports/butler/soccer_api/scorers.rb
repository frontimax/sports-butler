# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Scorers < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_competition, :by_competition_and_year]
        end

        def path
          :scorers
        end
      end
    end
  end
end