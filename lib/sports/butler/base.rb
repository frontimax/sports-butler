# frozen_string_literal: true

## SOCCER
require 'sports/butler/soccer_api/base'
# api_football_com
require 'sports/butler/soccer_api/api_football_com/countries'
# football_data_org
require 'sports/butler/soccer_api/football_data_org/countries'
# apifootball_com
require 'sports/butler/soccer_api/apifootball_com/base'
require 'sports/butler/soccer_api/apifootball_com/countries'


module Sports
  module Butler
    class Base

      ENDPOINTS = [
        :countries
      ]

      attr_accessor :sport, :api,:api_class, :sport_class,
                    :countries

      def initialize(sport:, api:)
        @sport  = sport
        @api    = api
        @api_class    = api.to_s.camelize
        @sport_class  = "#{sport.to_s.camelize}Api"

        build_endpoint_objects
      end

      ## ALIASES
      # countries
      def areas
        countries
      end

      private

      def scope
        "Sports::Butler::#{sport_class}::#{api_class}"
      end

      def build_endpoint_objects
        ENDPOINTS.each do |endpoint|
          send("#{endpoint}=", build_endpoint_classes(endpoint.capitalize))
        end
      end

      def build_endpoint_classes(name)
        if Kernel.const_defined?("#{scope}::#{name}")
          "#{scope}::#{name}".constantize.new(sport, api)
        else
          "NOT AVAILABLE: the endpoint '#{name}' is not available for this sport/api combination."
        end
      end
    end
  end
end