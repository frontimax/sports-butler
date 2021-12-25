# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Venues < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:by_id]
          # by_city, by_country, by_name, search
        end

        def path
          :venues
        end
      end
    end
  end
end