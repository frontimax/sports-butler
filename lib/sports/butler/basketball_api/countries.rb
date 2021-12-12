# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Countries < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:all, :by_name, :by_id]
        end


        def path
          :countries
        end
      end
    end
  end
end