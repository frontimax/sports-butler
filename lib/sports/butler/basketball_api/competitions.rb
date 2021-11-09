# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Competitions < Sports::Butler::BasketballApi::Base

        def path
          :competitions
        end

        def all
          api.get(path: build_path(path))
          api
        end
      end
    end
  end
end