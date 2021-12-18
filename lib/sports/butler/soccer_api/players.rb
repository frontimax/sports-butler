# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Players < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id, :by_id_and_season]
        end

        def path
          :players
        end
      end
    end
  end
end