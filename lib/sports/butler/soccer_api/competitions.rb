# frozen_string_literal: true
module Sports
  module Butler
    module SoccerApi
      class Competitions < Sports::Butler::SoccerApi::Base
        def path
          :competitions
        end

        def all()
          api.get(path: build_path(path))
          api
        end
      end
    end
  end
end