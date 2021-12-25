# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Timezones < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:all]
        end

        def path
          :timezones
        end
      end
    end
  end
end