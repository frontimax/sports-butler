# frozen_string_literal: true
require 'sports/butler/soccer_api/base'

module Sports
  module Butler
    module SoccerApi
      class Competitions < Sports::Butler::SoccerApi::Base
        def available_endpoint_methods
          [:all, :by_id, :search_by_name]
          # by_country by_country_name by_plan by_areas current_match_day seasons all_seasons all_leagues all_cups
        end

        def path
          :competitions
        end
      end
    end
  end
end