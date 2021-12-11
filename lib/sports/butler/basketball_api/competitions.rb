# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Competitions < Sports::Butler::BasketballApi::Base
        def available_endpoint_methods
          [:all]
        end

        # TODO: enable later with second basketball api as parent method
        # def path
        #   :competitions
        # end
      end
    end
  end
end