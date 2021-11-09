# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Countries < Sports::Butler::SoccerApi::Base
        def path
          :countries
        end

        def all()
          api.get(path: build_path(path))
          api
        end
      end
    end
  end
end