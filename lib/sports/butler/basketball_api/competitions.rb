# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Competitions < Sports::Butler::BasketballApi::Base
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