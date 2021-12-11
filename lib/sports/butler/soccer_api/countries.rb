# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Countries < Sports::Butler::SoccerApi::Base
        def available_endpoints
          [:all, :by_name]
        end

        def path
          :countries
        end
      end
    end
  end
end