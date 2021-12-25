# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Countries < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:all, :by_name, :by_id]
          # search_by_name, by_code
        end

        def path
          :countries
        end
      end
    end
  end
end