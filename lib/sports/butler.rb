# frozen_string_literal: true
require 'httparty'
require "sports/butler/version"
require "sports/butler/configuration"
require "sports/butler/soccer"

module Sports
  module Butler

    def self.new(sport: :soccer, api: :api_football_com)
      if Sports::Butler::Configuration.valid_sport_api?(sport, api)
        "Sports::Butler::#{sport.to_s.capitalize}"
          .constantize
          .new(api: api)
      else
        return text_error_sport_api
      end
    rescue StandardError => e
      return text_error_sport_api
    end

    def text_error_sport_api
      text  = "Invalid sport / api parameter. "
      text += "Available sports: #{Sports::Butler::Configuration::AVAILABLE_SPORTS.join(', ')}. "
      text += "Available apis: #{Sports::Butler::Configuration::AVAILABLE_APIS.join(', ')} "
      text
    end
  end
end
