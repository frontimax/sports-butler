# frozen_string_literal: true
require 'sports/butler/soccer_api/api_football_com/countries'

module Sports
  module Butler
    class Base

      attr_accessor :sport, :api,:api_class, :sport_class,
                    #:configuration, :api_endpoint,
                    :countries, :areas

      def initialize(sport:, api:)
        @sport  = sport
        @api    = api
        @api_class    = api.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        # @configuration = Configuration
        # @api_token = set_api_token
        # @api_endpoint = set_api_endpoint

        build_endpoint_objects
      end

      # TODO: via Array iteration dynamic!
      def build_endpoint_objects
        build_endpoint_countries
      end

      def scope
        "Sports::Butler::#{sport_class}::#{api_class}"
      end

      def build_endpoint_countries
        @countries = "#{scope}::Countries".constantize.new(self) if Kernel.const_defined?("#{scope}::Countries")
        @areas = "#{scope}::Countries".constantize.new(self) if Kernel.const_defined?("#{scope}::Countries")
      end

      # config.api_token[:soccer][:api_football_com]  = ENV['API_TOKEN_API_DASH_COM']
      def set_api_token
        @configuration.api_token[sport][api]
      rescue
        return nil
      end

      # config.api_endpoint[:soccer][:api_football_com]  = ENV['API_TOKEN_API_DASH_COM']
      def set_api_endpoint
        @configuration.api_endpoint[sport][api]
      rescue
        return nil
      end
    end
  end
end