# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Competitions < Sports::Butler::BasketballApi::Base

        def path
          :competitions
        end
      end
    end
  end
end