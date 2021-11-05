# frozen_string_literal: true
require 'httparty'
require 'sports/butler/api'
require "sports/butler/version"
require "sports/butler/configuration"
require "sports/butler/soccer"
require "sports/butler/basketball"

module Sports
  module Butler

    DEFAULT_SPORT = :soccer
    DEFAULT_API   = :api_football_com

    class << self
      def new(sport: DEFAULT_SPORT, api: DEFAULT_API)
        if Sports::Butler::Configuration.valid_sport_api?(sport, api)
          "Sports::Butler::#{sport.to_s.capitalize}"
            .constantize
            .new(sport: sport, api: api)
        else
          return text_error_sport_api
        end
      rescue StandardError => _e
        return text_error_sport_api
      end

      # TODO! add old logic from fb
      def get(path:, filters: {})
        Api.get(path: path, filters: filters)
      end

      private

      def text_error_sport_api
        text  = "Invalid sport / api parameter. "
        text += "Available sports: #{Sports::Butler::Configuration::AVAILABLE_SPORTS.join(', ')}. "
        text += "Available apis: #{Sports::Butler::Configuration::AVAILABLE_APIS.join(', ')} "
        text
      end
    end
  end
end
