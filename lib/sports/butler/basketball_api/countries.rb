# frozen_string_literal: true
module Sports
  module Butler
    module BasketballApi
      class Countries < Sports::Butler::BasketballApi::Base

        def path
          :countries
        end

        def all
          api.get(path: build_path(path))
          api
        end
      end
    end
  end
end