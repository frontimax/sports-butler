# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Competitions < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:all, :by_id, :search_by_name, :by_country_name, :seasons, :leagues, :cups, :by_country]
        end

        def path
          :competitions
        end
      end
    end
  end
end