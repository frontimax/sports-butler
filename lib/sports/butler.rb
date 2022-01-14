# frozen_string_literal: true
require 'httparty'

require "sports/butler/utility"
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

      # Sports::Butler Object build
      def new(sport: DEFAULT_SPORT, api_name: DEFAULT_API)
        if Sports::Butler::Configuration.valid_sport_api?(sport, api_name)
          "Sports::Butler::#{sport.to_s.capitalize}".constantize.new(sport: sport, api_name: api_name)
        else
          text_error_sport_api
        end
      end

      # Sports::Butler direct API call without Endpoint Classes
      def get(url:, sport: nil, api_name: nil, filters: {}, headers: {})
        Api.get(url: url, sport: sport, api_name: api_name, filters: filters, headers: headers)
      end

      # Sports::Butler show all endpoints in console output (info)
      def show_endpoints(dev_mode: false)
        Sports::Butler::Utility.endpoints(dev_mode: dev_mode)
      end

      private

      def text_error_sport_api
        text  = "Invalid sport / api parameter. "
        text += "Available sports: #{Sports::Butler::Configuration::AVAILABLE_SPORTS.join(', ')}. "
        text += "Available apis: #{Sports::Butler::Configuration::AVAILABLE_APIS.join(', ')}"
        text
      end
    end
  end
end