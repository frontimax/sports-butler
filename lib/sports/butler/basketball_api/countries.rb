# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Countries < Sports::Butler::BasketballApi::Base
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